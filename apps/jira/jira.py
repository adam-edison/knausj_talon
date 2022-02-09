from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: mac
app: chrome
win.title: /(JIRA)|(Task Assignment)/
"""


@ctx.action_class('edit')
class EditActions:
    def line_clone():
        actions.edit.select_line()
        actions.edit.copy()
        actions.key('end')
        actions.sleep('100ms')
        actions.key('enter')
        actions.edit.paste()
