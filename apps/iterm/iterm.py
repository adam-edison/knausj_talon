from talon import Context, Module, actions

ctx = Context()
mod = Module()

mod.apps.iterm2 = """
os: mac
and app.bundle: com.googlecode.iterm2
"""
ctx.matches = r"""
app: iterm2
"""

@mod.action_class
class PaneActions:
    def pane_jump(number: int):
        """Jumps to the specified pane in the current tab."""

    def pane_jump_into(tab_number: int, pane_number: int):
        """Jumps to the specified pane in the specified tab."""


directories_to_remap = {}
directories_to_exclude = {}


@ctx.action_class("app")
class AppActions:
    def tab_next():
        actions.key("shift-cmd-]")

    def tab_previous():
        actions.key("shift-cmd-[")


@ctx.action_class("edit")
class EditActions:
    def line_start():
        actions.key("home")

    def line_end():
        actions.key("end")


@ctx.action_class("user")
class UserActions:
    def tab_jump(number: int):
        actions.key(f"cmd-{number}")

    def tab_final():
        actions.key("cmd-9")

    def terminal_clear_screen():
        """Clear screen"""
        actions.key("ctrl-l")

    def pane_jump(number: int):
        actions.key(f"ctrl-{number}")

    def pane_jump_into(tab_number: int, pane_number: int):
        if not (1 <= tab_number <= 9):
            return

        if not (1 <= pane_number <= 9):
            return

        actions.key(f"cmd-{tab_number}")
        actions.sleep("200ms")
        actions.key(f"ctrl-{pane_number}")
