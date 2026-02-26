from talon import Module, actions, canvas, cron, ctrl, scope, screen, ui
from talon.skia import Paint, Rect

GRID_SIZE = 6


def clamp(value, lo, hi):
    """Clamp value between lo and hi."""
    return max(lo, min(hi, value))

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
        self._draw_rect_cache = None
        self.was_zoom_mouse_active = False
        self.was_control_mouse_active = False
        self.was_control1_mouse_active = False

    def setup(self):
        """Initialize canvas and set target rect to full screen."""
        self.screen = ui.screens()[0]
        self.rect = self.screen.rect.copy()
        self._draw_rect_cache = None
        self.img = None

        if self.mcanvas is not None:
            self.mcanvas.close()

        self.mcanvas = canvas.Canvas.from_screen(self.screen)

        if self.active:
            self.mcanvas.register("draw", self.draw)
            self.mcanvas.freeze()

    def show(self):
        """Save eye tracking state, snap cursor via control1, then show grid."""
        if self.active:
            return

        self.save_eye_tracking_state()
        actions.tracking.control1_toggle(True)
        cron.after("200ms", self.show_after_gaze_settle)

    def show_after_gaze_settle(self):
        """Read gaze position, switch to control mouse, auto-narrow and display."""
        self.auto_narrow_to_cursor()
        actions.tracking.control1_toggle(False)
        self.enable_control_mouse()

        self.mcanvas.register("draw", self.draw)
        self.active = True
        self.update_screenshot()

    def auto_narrow_to_cursor(self):
        """Narrow self.rect centered on the cursor's real screen position."""
        mx, my = ctrl.mouse_pos()
        self.narrow_centered_on(mx, my, factor=2)

    def close(self):
        """Map cursor position to target region, restore eye tracking, hide grid."""
        if not self.active:
            return

        target = self.cursor_to_target()

        self.mcanvas.unregister("draw", self.draw)
        self.mcanvas.close()
        self.mcanvas = None
        self.img = None
        self.active = False

        self.disable_control_mouse()
        self.restore_eye_tracking_state()
        ctrl.mouse_move(*target)

    def cursor_to_target(self):
        """Map the cursor's position on the drawn grid to the real target region."""
        draw_rect = self.calc_draw_rect()
        mx, my = ctrl.mouse_pos()

        pct_x = clamp((mx - draw_rect.x) / draw_rect.width, 0, 1)
        pct_y = clamp((my - draw_rect.y) / draw_rect.height, 0, 1)

        return (
            self.rect.x + pct_x * self.rect.width,
            self.rect.y + pct_y * self.rect.height,
        )

    def draw(self, c):
        """Draw the centered grid with screenshot background."""
        draw_rect = self.calc_draw_rect()

        self.draw_screenshot(c, draw_rect)
        self.draw_grid_lines(c, draw_rect)

    def calc_draw_rect(self):
        """Compute centered draw rect at ~1/2 screen size."""
        if self._draw_rect_cache is not None:
            return self._draw_rect_cache

        sw = self.screen.width
        sh = self.screen.height

        aspect = self.rect.width / self.rect.height

        if aspect >= 1:
            w = sw / 2
            h = w / aspect
        else:
            h = sh / 2
            w = h * aspect

        x = self.screen.x + (sw - w) / 2
        y = self.screen.y + (sh - h) / 2

        self._draw_rect_cache = Rect(x, y, w, h)
        return self._draw_rect_cache

    def draw_screenshot(self, c, draw_rect):
        """Draw captured screenshot as grid background."""
        if not self.img:
            return

        src = Rect(0, 0, self.img.width, self.img.height)
        c.draw_image_rect(self.img, src, draw_rect)

    def draw_grid_lines(self, c, draw_rect):
        """Draw grid lines over the draw rect."""
        paint = c.paint
        paint.color = "ff0000ff"
        paint.stroke_width = 1
        paint.style = Paint.Style.STROKE

        x, y, w, h = draw_rect.x, draw_rect.y, draw_rect.width, draw_rect.height

        for i in range(1, GRID_SIZE):
            c.draw_line(x + i * w / GRID_SIZE, y, x + i * w / GRID_SIZE, y + h)
            c.draw_line(x, y + i * h / GRID_SIZE, x + w, y + i * h / GRID_SIZE)

    def narrow_at_cursor(self):
        """Narrow target rect centered on cursor's position within the drawn grid."""
        if not self.active:
            return

        draw_rect = self.calc_draw_rect()
        mx, my = ctrl.mouse_pos()

        target_x = self.rect.x + clamp((mx - draw_rect.x) / draw_rect.width, 0, 1) * self.rect.width
        target_y = self.rect.y + clamp((my - draw_rect.y) / draw_rect.height, 0, 1) * self.rect.height

        self.narrow_centered_on(target_x, target_y)
        self.update_screenshot()

    def narrow_centered_on(self, x, y, factor=GRID_SIZE):
        """Narrow self.rect by the given factor, centered on (x, y)."""
        new_w = self.rect.width / factor
        new_h = self.rect.height / factor

        new_x = clamp(x - new_w / 2, self.rect.x, self.rect.x + self.rect.width - new_w)
        new_y = clamp(y - new_h / 2, self.rect.y, self.rect.y + self.rect.height - new_h)

        self._draw_rect_cache = None
        self.rect = Rect(new_x, new_y, new_w, new_h)

    def click_target(self):
        """Close grid (moves mouse to target) and click."""
        if not self.active:
            return

        self.close()
        actions.mouse_click(0)

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

    def gaze_grid_toggle():
        """Toggle the gaze mouse grid open/closed"""
        if gaze_grid.active:
            actions.user.gaze_grid_close()
        else:
            actions.user.gaze_grid_activate()

    def gaze_grid_narrow_at_cursor():
        """Select the grid cell under the cursor"""
        gaze_grid.narrow_at_cursor()

    def gaze_grid_click():
        """Click at the target location and close the grid"""
        _exit_grid_mode()
        gaze_grid.click_target()
        _restore_previous_modes()

