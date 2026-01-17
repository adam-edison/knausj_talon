from talon import Module, actions, ctrl, clip, screen, ui

mod = Module()

# Store the start position for rectangle selection
start_pos = None


@mod.action_class
class Actions:
    def screenshot_mark_start():
        """Mark the current mouse position as the start of a screenshot selection"""
        global start_pos
        start_pos = ctrl.mouse_pos()
        actions.app.notify(f"Start marked at {start_pos[0]}, {start_pos[1]}")

    def screenshot_capture_selection():
        """Capture the rectangle from marked start to current mouse position and copy to clipboard"""
        global start_pos
        if start_pos is None:
            actions.app.notify("No start position marked. Say 'snap start' first.")
            return

        end_pos = ctrl.mouse_pos()

        # Calculate rectangle bounds (handle any drag direction)
        x1 = min(start_pos[0], end_pos[0])
        y1 = min(start_pos[1], end_pos[1])
        x2 = max(start_pos[0], end_pos[0])
        y2 = max(start_pos[1], end_pos[1])

        width = x2 - x1
        height = y2 - y1

        if width < 1 or height < 1:
            actions.app.notify("Selection too small")
            start_pos = None
            return

        rect = ui.Rect(x1, y1, width, height)
        img = screen.capture_rect(rect)
        clip.set_image(img)

        # Clear the start position
        start_pos = None
        actions.app.notify("Screenshot copied to clipboard")

    def screenshot_cancel_selection():
        """Cancel the current screenshot selection"""
        global start_pos
        start_pos = None
        actions.app.notify("Screenshot selection cancelled")
