from talon import Context, actions
ctx = Context()

@ctx.action_class('user')
class UserActions:
    def pop():
        actions.user.click_if_control_mouse_disabled()
