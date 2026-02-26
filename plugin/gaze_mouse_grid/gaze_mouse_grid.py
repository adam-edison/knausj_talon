from talon import Module, actions, canvas, cron, ctrl, scope, screen, ui
from talon.skia import Paint, Rect

GRID_SIZE = 5

mod = Module()
mod.mode(
    "gaze_mouse_grid",
    desc="Gaze mouse grid is active — parrot sounds control the grid",
)

_previous_modes: set[str] = set()


def _save_current_modes():
    global _previous_modes
    modes = scope.get("mode", set())

    _previous_modes = set()
    if "command" in modes:
        _previous_modes.add("command")
    if "dictation" in modes:
        _previous_modes.add("dictation")


def _enter_grid_mode():
    actions.mode.disable("command")
    actions.mode.disable("dictation")
    actions.mode.enable("user.gaze_mouse_grid")


def _exit_grid_mode():
    actions.mode.disable("user.gaze_mouse_grid")


def _restore_previous_modes():
    for mode_name in _previous_modes:
        actions.mode.enable(mode_name)


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
        """Draw the centered grid with screenshot background."""
        draw_rect = self.calc_draw_rect()

        self.draw_screenshot(c, draw_rect)
        self.draw_grid_lines(c, draw_rect)

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
        """Draw the 5x5 grid lines over the draw rect."""
        paint = c.paint
        paint.color = "ff0000ff"
        paint.stroke_width = 1
        paint.style = Paint.Style.STROKE

        x, y, w, h = draw_rect.x, draw_rect.y, draw_rect.width, draw_rect.height

        for i in range(1, GRID_SIZE):
            c.draw_line(x + i * w / GRID_SIZE, y, x + i * w / GRID_SIZE, y + h)
            c.draw_line(x, y + i * h / GRID_SIZE, x + w, y + i * h / GRID_SIZE)

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
        """Convert a position to a 0-(GRID_SIZE-1) cell index, or None if outside."""
        relative = pos - origin

        if relative < 0 or relative >= size:
            return None

        index = int(relative / (size / GRID_SIZE))
        return min(index, GRID_SIZE - 1)

    def narrow_to_cell(self, row, col):
        """Narrow self.rect to the specified cell and update screenshot."""
        self.rect = Rect(
            self.rect.x + col * self.rect.width / GRID_SIZE,
            self.rect.y + row * self.rect.height / GRID_SIZE,
            self.rect.width / GRID_SIZE,
            self.rect.height / GRID_SIZE,
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

        _save_current_modes()
        gaze_grid.show()
        _enter_grid_mode()

    def gaze_grid_close():
        """Close the gaze mouse grid"""
        _exit_grid_mode()
        gaze_grid.close()
        _restore_previous_modes()

    def gaze_grid_narrow_at_cursor():
        """Select the grid cell under the cursor"""
        gaze_grid.narrow_at_cursor()

    def gaze_grid_click():
        """Click at the target location and close the grid"""
        _exit_grid_mode()
        gaze_grid.click_target()
        _restore_previous_modes()

    def gaze_grid_hover():
        """Hover at the target location and close the grid"""
        _exit_grid_mode()
        gaze_grid.hover_target()
        _restore_previous_modes()
