from talon import Module, Context, actions, ctrl

mod = Module()
ctx = Context()

ctx.matches = """
title: /Potionomics/
"""


@mod.action_class
class Actions:
    def double_click(times: int, delayMsBetween: int):
        "Double click [times], with a [delaySecondsBetween] each double click"
        for i in range(times):
            ctrl.mouse_click(button=0, down=True)
            actions.sleep("50ms")
            ctrl.mouse_click(button=0, up=True)
            actions.sleep("50ms")
            ctrl.mouse_click(button=0, down=True)
            actions.sleep("50ms")
            ctrl.mouse_click(button=0, up=True)
            actions.sleep(f"{delayMsBetween}ms")
