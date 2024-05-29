from talon import Context, Module, actions, clip

ctx = Context()
mod = Module()

@mod.action_class
class UserActions:
    def chrome_tab_this():
        """Open tab in Chrome and go to address on clipboard"""
        actions.edit.copy()
        actions.sleep("200ms")
        UserActions.chrome_tab_string(clip.get())

    def chrome_tab_line():
        """Open tab in Chrome and go to address on current line"""
        UserActions.chrome_tab_string(actions.user.line_parse_link())
    
    def chrome_tab_string(address: str):
        """Open tab in Chrome and go to address provided"""
        actions.user.switcher_focus("chrome")
        actions.sleep("100ms")
        actions.app.tab_open()
        actions.sleep("100ms")
        actions.user.paste(address)
        actions.key("enter")
