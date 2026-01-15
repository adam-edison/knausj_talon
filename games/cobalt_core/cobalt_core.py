from talon import Context, actions

ctx = Context()
ctx.matches = """
win.title: /cobalt core/i
"""


@ctx.action_class("user")
class UserActions:
    def face_held_blink():
        actions.mouse_click(0)
        print("cobalt core: blink -> left click")

    def face_held_raise_eyebrows():
        actions.mouse_click(1)
        print("cobalt core: raise eyebrows -> right click")

    def face_held_smile():
        actions.key("space")
        print("cobalt core: smile -> end turn (space)")

    def face_held_pucker_lips_outwards():
        actions.key("escape")
        print("cobalt core: pucker lips outwards -> menu (escape)")
