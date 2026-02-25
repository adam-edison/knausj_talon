from talon import Context, Module, actions, canvas, cron, ctrl, screen, settings, ui
from talon.skia import Paint, Rect
from talon.types.point import Point2d

mod = Module()
mod.tag(
    "gaze_mouse_grid_showing",
    desc="Tag indicates whether the gaze mouse grid is showing",
)

ctx = Context()


class GazeMouseGrid:
    def __init__(self):
        self.screen = None
        self.rect = None
        self.img = None
        self.mcanvas = None
        self.active = False
        self.was_zoom_mouse_active = False
        self.was_control_mouse_active = False
        self.was_control1_mouse_active = False

    def setup(self):
        """Initialize canvas and set target rect to full screen."""
        self.screen = ui.screens()[0]
        self.rect = self.screen.rect.copy()
        self.img = None

        if self.mcanvas is not None:
            self.mcanvas.close()

        self.mcanvas = canvas.Canvas.from_screen(self.screen)

        if self.active:
            self.mcanvas.register("draw", self.draw)
            self.mcanvas.freeze()

    def show(self):
        """Save eye tracking state, enable control mouse, show grid."""
        if self.active:
            return

        self.save_eye_tracking_state()
        self.enable_control_mouse()

        self.mcanvas.register("draw", self.draw)
        self.active = True
        self.update_screenshot()

    def close(self):
        """Disable control mouse, restore eye tracking state, hide grid."""
        if not self.active:
            return

        self.mcanvas.unregister("draw", self.draw)
        self.mcanvas.close()
        self.mcanvas = None
        self.img = None
        self.active = False

        self.disable_control_mouse()
        self.restore_eye_tracking_state()

    def draw(self, c):
        """Draw the centered grid with screenshot background and cell numbers."""
        draw_rect = self.calc_draw_rect()

        self.draw_screenshot(c, draw_rect)
        self.draw_grid_lines(c, draw_rect)
        self.draw_cell_numbers(c, draw_rect)

    def calc_draw_rect(self):
        """Compute centered draw rect at ~1/3 screen size."""
        sw = self.screen.width
        sh = self.screen.height

        aspect = self.rect.width / self.rect.height

        if aspect >= 1:
            w = sw / 3
            h = w / aspect
        else:
            h = sh / 3
            w = h * aspect

        x = self.screen.x + (sw - w) / 2
        y = self.screen.y + (sh - h) / 2

        return Rect(x, y, w, h)

    def draw_screenshot(self, c, draw_rect):
        """Draw captured screenshot as grid background."""
        if not self.img:
            return

        src = Rect(0, 0, self.img.width, self.img.height)
        c.draw_image_rect(self.img, src, draw_rect)

    def draw_grid_lines(self, c, draw_rect):
        """Draw the 3x3 grid lines over the draw rect."""
        paint = c.paint
        paint.color = "ff0000ff"
        paint.stroke_width = 1
        paint.style = Paint.Style.STROKE

        x, y, w, h = draw_rect.x, draw_rect.y, draw_rect.width, draw_rect.height

        c.draw_line(x + w // 3, y, x + w // 3, y + h)
        c.draw_line(x + 2 * w // 3, y, x + 2 * w // 3, y + h)
        c.draw_line(x, y + h // 3, x + w, y + h // 3)
        c.draw_line(x, y + 2 * h // 3, x + w, y + 2 * h // 3)

    def draw_cell_numbers(self, c, draw_rect):
        """Draw numbered labels in each cell."""
        paint = c.paint
        paint.text_align = paint.TextAlign.CENTER

        x, y, w, h = draw_rect.x, draw_rect.y, draw_rect.width, draw_rect.height

        for row in range(3):
            for col in range(3):
                num = row * 3 + col + 1
                text = str(num)
                text_rect = paint.measure_text(text)[1]

                cx = x + w / 6 + col * w / 3
                cy = y + h / 6 + row * h / 3

                bg = text_rect.copy()
                bg.center = Point2d(cx, cy)
                bg = bg.inset(-4)

                paint.color = "9999995f"
                paint.style = Paint.Style.FILL
                c.draw_rect(bg)

                paint.color = "00ff00ff"
                c.draw_text(text, cx, cy + text_rect.height / 2)

    def narrow_at_cursor(self):
        """Map cursor position on drawn grid to a cell, narrow target rect."""
        if not self.active:
            return

        draw_rect = self.calc_draw_rect()
        mx, my = ctrl.mouse_pos()

        col = self.pos_to_cell_index(mx, draw_rect.x, draw_rect.width)
        row = self.pos_to_cell_index(my, draw_rect.y, draw_rect.height)

        if col is None or row is None:
            return

        self.narrow_to_cell(row, col)

    def pos_to_cell_index(self, pos, origin, size):
        """Convert a position to a 0-2 cell index, or None if outside."""
        relative = pos - origin

        if relative < 0 or relative >= size:
            return None

        index = int(relative / (size / 3))
        return min(index, 2)

    def narrow_to_cell(self, row, col):
        """Narrow self.rect to the specified cell and update screenshot."""
        self.rect = Rect(
            self.rect.x + col * self.rect.width / 3,
            self.rect.y + row * self.rect.height / 3,
            self.rect.width / 3,
            self.rect.height / 3,
        )

        self.update_screenshot()

    def click_target(self):
        """Move cursor to target center, click, and close grid."""
        if not self.active:
            return

        target = self.rect.center
        self.close()
        ctrl.mouse_move(*target)
        actions.mouse_click(0)

    def hover_target(self):
        """Move cursor to target center and close grid without clicking."""
        if not self.active:
            return

        target = self.rect.center
        self.close()
        ctrl.mouse_move(*target)

    def update_screenshot(self):
        """Capture screenshot of target rect for background display."""

        def finish_capture():
            self.img = screen.capture_rect(self.rect)
            self.mcanvas.freeze()

        self.mcanvas.hide()
        cron.after("16ms", finish_capture)

    def save_eye_tracking_state(self):
        """Record which eye tracking modes are currently active."""
        self.was_zoom_mouse_active = actions.tracking.control_zoom_enabled()
        self.was_control_mouse_active = actions.tracking.control_enabled()
        self.was_control1_mouse_active = actions.tracking.control1_enabled()

    def enable_control_mouse(self):
        """Disable zoom mouse if active, then enable control mouse."""
        if self.was_zoom_mouse_active:
            actions.tracking.control_zoom_toggle(False)

        if not actions.tracking.control_enabled():
            actions.tracking.control_toggle(True)

    def disable_control_mouse(self):
        """Turn off control mouse (gaze tracking)."""
        if actions.tracking.control_enabled():
            actions.tracking.control_toggle(False)

    def restore_eye_tracking_state(self):
        """Restore eye tracking modes to what they were before show()."""
        if self.was_control_mouse_active and not actions.tracking.control_enabled():
            actions.tracking.control_toggle(True)

        if self.was_control1_mouse_active and not actions.tracking.control1_enabled():
            actions.tracking.control1_toggle(True)

        if self.was_zoom_mouse_active and not actions.tracking.control_zoom_enabled():
            actions.tracking.control_zoom_toggle(True)

        self.was_zoom_mouse_active = False
        self.was_control_mouse_active = False
        self.was_control1_mouse_active = False


gaze_grid = GazeMouseGrid()


@mod.action_class
class GazeGridActions:
    def gaze_grid_activate():
        """Show the gaze mouse grid"""
        if not gaze_grid.mcanvas:
            gaze_grid.setup()

        gaze_grid.show()
        ctx.tags = ["user.gaze_mouse_grid_showing"]

    def gaze_grid_close():
        """Close the gaze mouse grid"""
        ctx.tags = []
        gaze_grid.close()

    def gaze_grid_narrow_at_cursor():
        """Select the grid cell under the cursor"""
        gaze_grid.narrow_at_cursor()

    def gaze_grid_click():
        """Click at the target location and close the grid"""
        ctx.tags = []
        gaze_grid.click_target()

    def gaze_grid_hover():
        """Hover at the target location and close the grid"""
        ctx.tags = []
        gaze_grid.hover_target()
