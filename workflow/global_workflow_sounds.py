"""
Global workflow sounds: parrot combos (500ms window) and continuous scroll.

Requires sss/shh to be sustained for 300ms before scrolling starts,
filtering out false positives during speech.
"""

from talon import Module, Context, actions, cron

mod = Module()
ctx = Context()

global_parrot_config = {
    "puh puh": ("enter", lambda: actions.key("enter")),
    "puh clop": ("puh clop", lambda: actions.app.notify("puh clop")),
}


@ctx.action_class("user")
class UserActions:
    def parrot_config():
        return global_parrot_config

_pending_jobs: dict[str, cron.Job] = {}
_scroll_jobs: dict[str, cron.Job] = {}


def _do_scroll_up():
    actions.user.mouse_scroll_up(0.1)


def _do_scroll_down():
    actions.user.mouse_scroll_down(0.1)


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
