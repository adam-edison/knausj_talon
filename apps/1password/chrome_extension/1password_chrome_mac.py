from talon import Context, Module, actions, clip

ctx = Context()
mod = Module()

ctx.matches = r"""
os: mac
and app: chrome
os: mac
and app: brave
"""


@mod.action_class
class Actions:
    def password_open_search():
        """Opens 1Password Chrome extension quick search"""
        actions.sleep("100ms")
        actions.key("cmd-shift-x")
        actions.sleep("1000ms")

    def password_search_string(key: str):
        """Searches for a key in 1Password extension"""
        actions.sleep("50ms")
        actions.insert(key)
        actions.sleep("500ms")

    def password_copy_password():
        """Copies password from 1Password extension search results"""
        actions.sleep("50ms")
        actions.key("right")
        actions.key("down")
        actions.sleep("500ms")
        actions.key("enter")
        actions.sleep("50ms")

    def get_password(key: str):
        """Searches 1Password for key and copies the password to clipboard"""
        actions.user.switcher_focus("chrome")
        actions.sleep("500ms")
        actions.user.password_open_search()
        actions.user.password_search_string(key)
        actions.user.password_copy_password()
        actions.sleep("500ms")
        actions.key("esc")
        return clip.text()
