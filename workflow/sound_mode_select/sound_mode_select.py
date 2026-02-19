"""
Sound mode select: spit opens a menu to pick an action via sounds or voice.

Reserves one sound (spit) as a "shift key" that opens a selection menu.
Other sounds (kuh, tih, clop, puh) map to menu items 1-4. Users can also
say a number or mode name. This eliminates combo sounds so every single
sound fires instantly.
"""

from talon import Module, actions, imgui, scope

mod = Module()
mod.mode("sound_mode_select", desc="Sound mode select menu is open")

_registered_modes: list[tuple[str, str, callable]] = []
_previous_modes: set[str] = set()

_sound_hints = ["kuh", "tih", "clop", "puh"]


def _save_current_modes():
    global _previous_modes
    modes = scope.get("mode", set())

    _previous_modes = set()
    if "command" in modes:
        _previous_modes.add("command")
    if "dictation" in modes:
        _previous_modes.add("dictation")


def _restore_previous_modes():
    for mode_name in _previous_modes:
        actions.mode.enable(mode_name)


def _enter_select_mode():
    actions.mode.disable("command")
    actions.mode.disable("dictation")
    actions.mode.enable("user.sound_mode_select")


def _exit_select_mode():
    actions.mode.disable("user.sound_mode_select")


@imgui.open(y=0)
def gui(gui: imgui.GUI):
    gui.text("Sound Mode Select")
    gui.line()

    for index, (name, label, callback) in enumerate(_registered_modes, 1):
        hint = _sound_hints[index - 1] if index <= len(_sound_hints) else ""
        gui.text(f"{index}. [{hint}] {label}" if hint else f"{index}. {label}")

    gui.spacer()
    gui.text("[spit] or 'cancel' to close")


@mod.action_class
class Actions:
    def sound_mode_select_toggle():
        """Toggle the sound mode select menu open/closed."""
        if gui.showing:
            _exit_select_mode()
            gui.hide()
            _restore_previous_modes()
            return

        _save_current_modes()
        _enter_select_mode()
        gui.show()

    def sound_mode_select_choose(index: int):
        """Choose a mode by its 1-based index."""
        if index < 1 or index > len(_registered_modes):
            return

        name, label, callback = _registered_modes[index - 1]

        _exit_select_mode()
        gui.hide()
        _restore_previous_modes()

        callback()

    def sound_mode_register(name: str, label: str, callback: callable):
        """Register a mode in the sound mode select menu. Skips duplicates by name."""
        for existing_name, _, _ in _registered_modes:
            if existing_name == name:
                return

        _registered_modes.append((name, label, callback))
