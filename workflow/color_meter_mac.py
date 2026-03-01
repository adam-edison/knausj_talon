"""Copy color from Classic Color Meter app. Handles app name variants and not-running case."""
from talon import Module, actions, ui

mod = Module()

# Try these names in order when focusing the color meter app (macOS may show different names).
COLOR_METER_APP_NAMES = ("Classic Color Meter", "Color Meter", "ClassicColorMeter")


@mod.action_class
class Actions:
    def copy_color():
        """Switch to Classic Color Meter, press Shift-Cmd-C, then notify."""
        app_obj = None
        for name in COLOR_METER_APP_NAMES:
            try:
                app_obj = actions.user.get_running_app(name)
                break
            except RuntimeError:
                continue

        if app_obj is None:
            actions.app.notify(
                "Classic Color Meter is not running. Open it first, then say 'copy color'.",
                "Color meter",
            )
            return

        actions.user.switcher_focus_app(app_obj)
        actions.sleep("100ms")
        actions.key("shift-cmd-c")
        actions.app.notify("Color copied", "Color meter")
