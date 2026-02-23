from talon import Module, actions

mod = Module()


@mod.action_class
class UserActions:
    def screenshot_window_paste_iterm():
        """Take a screenshot of the active window to clipboard, switch to iTerm, and paste."""
        actions.user.screenshot_window_clipboard()
        actions.user.switcher_focus("iTerm2")
        actions.sleep("150ms")
        actions.key("ctrl-v")
