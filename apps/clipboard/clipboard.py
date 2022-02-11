from talon import Context, Module, actions, clip

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def clipboard_get():
        """returns the contents of the clipboard"""
        return clip.text()
