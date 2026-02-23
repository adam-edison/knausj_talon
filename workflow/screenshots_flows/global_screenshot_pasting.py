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

    def screenshot_full_page_paste_iterm():
        """Take a screenshot of the full page using GoFullPage - Full Page Screen Capture
        and paste to iTerm."""
        
        """Trigger the GoFullPage - Full Page Screen Capture app."""
        actions.key("alt-shift-p")
        actions.sleep("5000ms")

        """Copy the screenshot to clipboard."""
        actions.key("cmd-c")
        actions.sleep("100ms")
        
        """Switch to iTerm and paste the screenshot."""
        actions.user.switcher_focus("iTerm2")
        actions.sleep("150ms")
        actions.key("ctrl-v")

    def screenshot_screen_paste_iterm():
        """Take a screenshot of the screen to clipboard, switch to iTerm, and paste."""
        actions.user.screenshot_clipboard()
        actions.user.switcher_focus("iTerm2")
        actions.sleep("150ms")
        actions.key("ctrl-v")