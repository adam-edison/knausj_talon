from talon import Context, actions
ctx = Context()
ctx.matches = r"""
mode: user.gaming
"""

@ctx.action_class('user')
class UserActions:
    def pop():        actions.mouse_click(0)
    def hiss_start(): actions.mouse_drag(0)
    def hiss_end():   actions.mouse_release(0)
