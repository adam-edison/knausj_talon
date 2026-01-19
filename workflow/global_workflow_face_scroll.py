"""
Face-triggered continuous scroll with grace period and multi-tap confirmation.

Uses direct mouse_scroll() to avoid the GUI popup from the built-in continuous scroll.
Also includes delayed control mouse toggle.

Multi-tap confirmation:
  When tap_window_ms > 0, requires multiple taps within the window before triggering.
  This improves reliability by filtering out single spurious detections.

  Example usage in .talon:
    # Single tap (default):
    face(raise_eyebrows:start): user.face_scroll_up_start(500)

    # Double-tap, 800ms window:
    face(raise_eyebrows:start): user.face_scroll_up_start(500, 800)

    # Triple-tap, 1000ms window:
    face(raise_eyebrows:start): user.face_scroll_up_start(500, 1000, 3)
"""

import time
from talon import Module, actions, cron

mod = Module()

# Track scheduled scroll jobs and active scroll jobs
_pending_jobs: dict[str, cron.Job] = {}
_scroll_jobs: dict[str, cron.Job] = {}

# Track pending control mouse toggle
_control_mouse_pending: cron.Job | None = None

# Track pending mouse click
_click_pending: cron.Job | None = None

# Scroll amount per tick (can be changed via voice command)
_scroll_speed = 8

# Multi-tap confirmation tracking
# Maps action key -> list of tap timestamps
_tap_times: dict[str, list[float]] = {}


def _check_tap_confirmed(key: str, tap_window_ms: int, required_taps: int) -> bool:
    """
    Check if enough taps have occurred within the time window.

    Records the current tap and returns True if we've reached the required count.
    Resets tap count after confirmation to prepare for next sequence.
    """
    now = time.time()
    window_sec = tap_window_ms / 1000.0

    # Get existing taps or create new list
    taps = _tap_times.get(key, [])

    # Add current tap
    taps.append(now)

    # Prune taps outside the window
    cutoff = now - window_sec
    taps = [t for t in taps if t > cutoff]

    # Check if we have enough taps
    if len(taps) >= required_taps:
        # Reset for next sequence
        _tap_times[key] = []
        return True

    # Store updated taps
    _tap_times[key] = taps
    return False


def _do_scroll_up():
    """Scroll up one tick."""
    actions.mouse_scroll(-_scroll_speed)


def _do_scroll_down():
    """Scroll down one tick."""
    actions.mouse_scroll(_scroll_speed)


def _start_scroll_up():
    """Called after delay to start continuous scroll up."""
    _pending_jobs.pop("raise_eyebrows", None)
    # Start repeating scroll job
    _scroll_jobs["raise_eyebrows"] = cron.interval("16ms", _do_scroll_up)


def _start_scroll_down():
    """Called after delay to start continuous scroll down."""
    _pending_jobs.pop("smile", None)
    # Start repeating scroll job
    _scroll_jobs["smile"] = cron.interval("16ms", _do_scroll_down)


def _stop_scroll(key: str):
    """Stop any pending or active scroll for the given key."""
    if job := _pending_jobs.pop(key, None):
        cron.cancel(job)
    if job := _scroll_jobs.pop(key, None):
        cron.cancel(job)


@mod.action_class
class Actions:
    def face_scroll_up_start(
        grace_ms: int = 300, tap_window_ms: int = 0, required_taps: int = 1
    ):
        """
        Schedule continuous scroll up after grace period.

        Args:
            grace_ms: Delay before scrolling starts (filters accidental holds)
            tap_window_ms: Time window for multi-tap confirmation (0 = single tap)
            required_taps: Number of taps required within window (default 1)
        """
        # If multi-tap mode, check if we have enough taps
        if tap_window_ms > 0 and required_taps > 1:
            if not _check_tap_confirmed("raise_eyebrows", tap_window_ms, required_taps):
                return  # Not enough taps yet, wait for more

        _stop_scroll("raise_eyebrows")
        _pending_jobs["raise_eyebrows"] = cron.after(f"{grace_ms}ms", _start_scroll_up)

    def face_scroll_up_stop():
        """Stop scroll up."""
        _stop_scroll("raise_eyebrows")

    def face_scroll_down_start(
        grace_ms: int = 300, tap_window_ms: int = 0, required_taps: int = 1
    ):
        """
        Schedule continuous scroll down after grace period.

        Args:
            grace_ms: Delay before scrolling starts (filters accidental holds)
            tap_window_ms: Time window for multi-tap confirmation (0 = single tap)
            required_taps: Number of taps required within window (default 1)
        """
        # If multi-tap mode, check if we have enough taps
        if tap_window_ms > 0 and required_taps > 1:
            if not _check_tap_confirmed("smile", tap_window_ms, required_taps):
                return  # Not enough taps yet, wait for more

        _stop_scroll("smile")
        _pending_jobs["smile"] = cron.after(f"{grace_ms}ms", _start_scroll_down)

    def face_scroll_down_stop():
        """Stop scroll down."""
        _stop_scroll("smile")

    def face_scroll_speed_set(speed: int):
        """Set face scroll speed (1-50, default 8)."""
        global _scroll_speed
        _scroll_speed = max(1, min(50, speed))
        actions.app.notify(f"Face scroll speed: {_scroll_speed}")

    def face_scroll_speed_get() -> int:
        """Get current face scroll speed."""
        return _scroll_speed

    def face_control_mouse_start(
        grace_ms: int = 300, tap_window_ms: int = 0, required_taps: int = 1
    ):
        """
        Schedule control mouse toggle after grace period.

        Args:
            grace_ms: Delay before toggle triggers (filters accidental holds)
            tap_window_ms: Time window for multi-tap confirmation (0 = single tap)
            required_taps: Number of taps required within window (default 1)
        """
        global _control_mouse_pending

        # If multi-tap mode, check if we have enough taps
        if tap_window_ms > 0 and required_taps > 1:
            if not _check_tap_confirmed("control_mouse", tap_window_ms, required_taps):
                return  # Not enough taps yet, wait for more

        if _control_mouse_pending:
            cron.cancel(_control_mouse_pending)
        _control_mouse_pending = cron.after(f"{grace_ms}ms", _do_control_mouse_toggle)

    def face_control_mouse_stop():
        """Cancel pending control mouse toggle if released too early."""
        global _control_mouse_pending
        if _control_mouse_pending:
            cron.cancel(_control_mouse_pending)
            _control_mouse_pending = None

    def face_click_start(
        grace_ms: int = 600, tap_window_ms: int = 0, required_taps: int = 1
    ):
        """
        Schedule mouse click after grace period.

        Args:
            grace_ms: Delay before click triggers (filters accidental holds)
            tap_window_ms: Time window for multi-tap confirmation (0 = single tap)
            required_taps: Number of taps required within window (default 1)
        """
        global _click_pending

        # If multi-tap mode, check if we have enough taps
        if tap_window_ms > 0 and required_taps > 1:
            if not _check_tap_confirmed("click", tap_window_ms, required_taps):
                return  # Not enough taps yet, wait for more

        if _click_pending:
            cron.cancel(_click_pending)
        _click_pending = cron.after(f"{grace_ms}ms", _do_mouse_click)

    def face_click_stop():
        """Cancel pending mouse click if released too early."""
        global _click_pending
        if _click_pending:
            cron.cancel(_click_pending)
            _click_pending = None


def _do_control_mouse_toggle():
    """Toggle control mouse after delay elapsed."""
    global _control_mouse_pending
    _control_mouse_pending = None
    actions.tracking.control_toggle()


def _do_mouse_click():
    """Click mouse after delay elapsed."""
    global _click_pending
    _click_pending = None
    actions.mouse_click(0)
