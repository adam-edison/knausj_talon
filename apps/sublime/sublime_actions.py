from talon import Context, actions
ctx = Context()
ctx.matches = r"""
app: sublime
"""

@ctx.action_class('edit')
class EditActions:
    def line_clone():
        actions.key('cmd-shift-d')
