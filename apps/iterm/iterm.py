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

primary_tab: int = 1
total_tabs: int = 9
secondary_index: int = 0

@mod.action_class
class PaneActions:
    def pane_jump(number: int):
        """Jumps to the specified pane in the current tab."""

    def pane_jump_into(tab_number: int, pane_number: int):
        """Jumps to the specified pane in the specified tab."""
    
    def set_iterm_tab_primary(number: int):
        """Sets the primary iTerm tab number."""
        global primary_tab, secondary_index
        primary_tab = number
        secondary_index = 0
        actions.app.notify(f"Primary tab: {primary_tab}")

    def jump_to_primary():
        """Jumps to the primary iTerm tab."""
        actions.key(f"cmd-{primary_tab}")

    def set_iterm_tab_total(number: int):
        """Sets the total number of iTerm tabs."""
        global total_tabs, secondary_index
        total_tabs = number
        secondary_index = 0
        actions.app.notify(f"Total tabs: {total_tabs}")

    def cycle_to_next_secondary():
        """Cycles to the next secondary (non-primary) tab."""
        global secondary_index
        tabs = [t for t in range(1, total_tabs + 1) if t != primary_tab]
        if not tabs:
            return
        secondary_index = secondary_index % len(tabs)
        actions.key(f"cmd-{tabs[secondary_index]}")
        secondary_index = (secondary_index + 1) % len(tabs)

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
