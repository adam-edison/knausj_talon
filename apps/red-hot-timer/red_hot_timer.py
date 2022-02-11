from talon import Context, Module, actions

ctx = Context()
mod = Module()

ctx.matches = r"""
os: mac
"""


@mod.action_class
class Actions:
    def red_hot_timer_set(minutes: int):
        """set the timer"""
        actions.key("ctrl-shift-alt-cmd-t")
        actions.sleep("200ms")
        actions.insert(f"{minutes}m")
        actions.sleep("500ms")
        actions.key("enter")

    def text_edit_caption(text: str):
        """set the text in textedit"""
        actions.sleep("100ms")
        actions.user.switcher_focus("textedit")
        actions.sleep("200ms")
        actions.edit.select_all()
        actions.insert(text)
