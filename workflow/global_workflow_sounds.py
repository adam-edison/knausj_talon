"""
Global workflow sounds: scroll (sss/shh) and command/dictation toggle.

- Scrolling: sss/shh sustained 300ms scroll up/down.
- Command/dictation toggle registered with sound_mode_select menu.
"""

from talon import Module, actions, app, cron, ctrl, scope

mod = Module()


# --- Mode switch: command <-> dictation with notification ---


def _switch_to_dictation():
    actions.mode.disable("sleep")
    actions.mode.disable("command")
    actions.mode.enable("dictation")
    actions.user.code_clear_language_mode()
    actions.user.gdb_disable()
    actions.app.notify("Dictation mode")


def _switch_to_command():
    actions.mode.disable("sleep")
    actions.mode.disable("dictation")
    actions.mode.enable("command")
    actions.app.notify("Command mode")


def _toggle_command_dictation():
    modes = scope.get("mode", set())

    if "dictation" in modes and "command" not in modes:
        _switch_to_command()
    else:
        _switch_to_dictation()


def _toggle_left_drag():
    if 0 in ctrl.mouse_buttons_down():
        actions.user.mouse_drag_end()
        actions.app.notify("Left drag OFF")
    else:
        actions.user.mouse_drag(0)
        actions.app.notify("Left drag ON")


def _on_ready():
    actions.user.sound_mode_register(
        "command_dictation_toggle",
        "Command/Dictation Toggle",
        _toggle_command_dictation,
    )


app.register("ready", _on_ready)


# --- Scrolling ---

_pending_jobs: dict[str, cron.Job] = {}
_scroll_jobs: dict[str, cron.Job] = {}

# Scroll speed (1.0-50.0, default 8.0). 8.0 reproduces the original 0.1 wheel-ticks per 16ms.
_scroll_speed: float = 8.0


def _scroll_amount() -> float:
    return _scroll_speed / 80.0


def _do_scroll_up():
    actions.user.mouse_scroll_up(_scroll_amount())


def _do_scroll_down():
    actions.user.mouse_scroll_down(_scroll_amount())


def _start_scroll_up():
    _pending_jobs.pop("sss", None)
    _scroll_jobs["sss"] = cron.interval("16ms", _do_scroll_up)


def _start_scroll_down():
    _pending_jobs.pop("shh", None)
    _scroll_jobs["shh"] = cron.interval("16ms", _do_scroll_down)


def _stop_scroll(key: str):
    if job := _pending_jobs.pop(key, None):
        cron.cancel(job)

    if job := _scroll_jobs.pop(key, None):
        cron.cancel(job)


@mod.action_class
class Actions:
    def sound_scroll_up_start(delay_ms: int = 300):
        """Schedule continuous scroll up after delay."""
        _stop_scroll("sss")
        _pending_jobs["sss"] = cron.after(f"{delay_ms}ms", _start_scroll_up)

    def sound_scroll_up_stop():
        """Stop scroll up."""
        _stop_scroll("sss")

    def sound_scroll_down_start(delay_ms: int = 300):
        """Schedule continuous scroll down after delay."""
        _stop_scroll("shh")
        _pending_jobs["shh"] = cron.after(f"{delay_ms}ms", _start_scroll_down)

    def sound_scroll_down_stop():
        """Stop scroll down."""
        _stop_scroll("shh")

    def sound_scroll_speed_multiply(factor: float):
        """Multiply sound scroll speed by factor (clamped to 1.0-50.0)."""
        global _scroll_speed
        _scroll_speed = max(1.0, min(50.0, _scroll_speed * factor))
        actions.app.notify(f"Sound scroll speed: {_scroll_speed:.2f}")

    def workflow_toggle_command_dictation():
        """Toggle between command and dictation mode."""
        _toggle_command_dictation()

    def workflow_toggle_left_drag():
        """Toggle left mouse drag and show ON/OFF notification."""
        _toggle_left_drag()
