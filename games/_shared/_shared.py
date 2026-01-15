from talon import Module, Context, actions, ctrl

mod = Module()
ctx = Context()


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

    def single_click(times: int, delayMsBetween: int):
        "Single click [times], with a [delaySecondsBetween] each click"
        for i in range(times):
            ctrl.mouse_click(button=0, down=True)
            actions.sleep("50ms")
            ctrl.mouse_click(button=0, up=True)
            actions.sleep(f"{delayMsBetween}ms")

    def mouse_drag_to_position_and_return(x: float, y: float):
        "Drag and drop from current position to target xy and return to current position"
        position = ctrl.mouse_pos()
        actions.mouse_drag(0)
        actions.sleep("50ms")
        ctrl.mouse_move(x, y)
        actions.sleep("50ms")
        actions.user.mouse_drag_end()
        actions.sleep("50ms")
        ctrl.mouse_move(position[0], position[1])
        actions.sleep("200ms")

    def mouse_click_position_and_return(x: float, y: float):
        "Click target xy and return to current position"
        position = ctrl.mouse_pos()
        actions.sleep("100ms")
        ctrl.mouse_move(x, y)
        actions.sleep("100ms")
        actions.user.single_click(1, 50)
        ctrl.mouse_move(position[0], position[1])
        actions.sleep("200ms")

    def mouse_move_relative(x: float, y: float):
        """move the cursor relative to its current position"""
        position = ctrl.mouse_pos()
        new_x = position[0] + x
        new_y = position[1] + y
        print(f"{position} moving {x},{y} to {new_x},{new_y}")
        ctrl.mouse_move(new_x, new_y)

    def key_repeat(key: str, times: int, delay_ms: int = 50):
        """Press a key multiple times with a delay between each press"""
        for i in range(times):
            actions.key(key)
            if i < times - 1:  # Don't delay after the last press
                actions.sleep(f"{delay_ms}ms")