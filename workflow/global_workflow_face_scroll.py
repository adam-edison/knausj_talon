"""
Face-triggered continuous scroll with grace period.

Uses direct mouse_scroll() to avoid the GUI popup from the built-in continuous scroll.
Also includes delayed control mouse toggle.
"""

from talon import Module, actions, cron

mod = Module()

# Track scheduled scroll jobs and active scroll jobs
_pending_jobs: dict[str, cron.Job] = {}
_scroll_jobs: dict[str, cron.Job] = {}

# Track pending control mouse toggle
_control_mouse_pending: cron.Job | None = None

# Scroll amount per tick (can be changed via voice command)
_scroll_speed = 8


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
    def face_scroll_up_start(delay_ms: int = 300):
        """Schedule continuous scroll up after delay."""
        _stop_scroll("raise_eyebrows")
        _pending_jobs["raise_eyebrows"] = cron.after(f"{delay_ms}ms", _start_scroll_up)

    def face_scroll_up_stop():
        """Stop scroll up."""
        _stop_scroll("raise_eyebrows")

    def face_scroll_down_start(delay_ms: int = 300):
        """Schedule continuous scroll down after delay."""
        _stop_scroll("smile")
        _pending_jobs["smile"] = cron.after(f"{delay_ms}ms", _start_scroll_down)

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

    def face_control_mouse_start(delay_ms: int = 300):
        """Schedule control mouse toggle after delay."""
        global _control_mouse_pending
        if _control_mouse_pending:
            cron.cancel(_control_mouse_pending)
        _control_mouse_pending = cron.after(f"{delay_ms}ms", _do_control_mouse_toggle)

    def face_control_mouse_stop():
        """Cancel pending control mouse toggle if released too early."""
        global _control_mouse_pending
        if _control_mouse_pending:
            cron.cancel(_control_mouse_pending)
            _control_mouse_pending = None


def _do_control_mouse_toggle():
    """Toggle control mouse after delay elapsed."""
    global _control_mouse_pending
    _control_mouse_pending = None
    actions.tracking.control_toggle()
