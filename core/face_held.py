"""
Track facial expressions and trigger actions only when held for a minimum duration.

Usage in .talon files:

    # Simple key press - all controlled from talon file:
    face(smile:start): user.face_held_start("smile", 300)
    face(smile:stop): user.face_held_key("smile", "space")  # press space if held 300ms+

    # Override action in Python (for complex logic):
    face(smile:start): user.face_held_start("smile", 2000)
    face(smile:stop): user.face_held_trigger("smile")  # calls face_held_smile() action

Supported expressions:
  macOS Catalina+: smile, open_mouth, stick_out_tongue, raise_eyebrows
  macOS Big Sur+:  eye_blink, scrunch_nose, pucker_lips_outwards,
                   pucker_lips_left, pucker_lips_right
"""

import time
from talon import Module, actions

mod = Module()

# Track start times and required durations for each expression
expression_data: dict[str, tuple[float, int]] = {}  # {expression: (start_time, duration_ms)}

DEFAULT_DURATION_MS = 500


def _check_held(expression: str) -> bool:
    """Check if expression was held long enough. Returns True if so."""
    data = expression_data.pop(expression, None)
    if data is None:
        return False

    start_time, required_duration_ms = data
    held_duration_ms = (time.time() - start_time) * 1000
    return held_duration_ms >= required_duration_ms


@mod.action_class
class Actions:
    def face_held_start(expression: str, duration_ms: int = DEFAULT_DURATION_MS):
        """Record the start time and required duration of a facial expression"""
        expression_data[expression] = (time.time(), duration_ms)

    def face_held_key(expression: str, key_spec: str) -> bool:
        """
        Press key(s) if expression was held long enough.
        key_spec is passed directly to actions.key() - e.g. "space", "ctrl-c", "enter".
        Returns True if the key was pressed.
        """
        if _check_held(expression):
            actions.key(key_spec)
            return True

        return False

    def face_held_action(expression: str, action_name: str) -> bool:
        """
        Call a user action by name if expression was held long enough.
        action_name should be like "coromon_select" (calls actions.user.coromon_select()).
        Returns True if the action was called.
        """
        if not _check_held(expression):
            return False

        action_fn = getattr(actions.user, action_name, None)
        if action_fn:
            action_fn()
            return True

        return False

    def face_held_trigger(expression: str) -> bool:
        """
        Check if expression was held long enough and trigger action if so.
        Calls the corresponding face_held_<expression>() action.
        Returns True if the action was triggered.
        """
        if not _check_held(expression):
            return False

        # Call the specific action for this expression
        action_map = {
            "smile": actions.user.face_held_smile,
            "open_mouth": actions.user.face_held_open_mouth,
            "stick_out_tongue": actions.user.face_held_stick_out_tongue,
            "raise_eyebrows": actions.user.face_held_raise_eyebrows,
            "eye_blink": actions.user.face_held_eye_blink,
            "scrunch_nose": actions.user.face_held_scrunch_nose,
            "pucker_lips_outwards": actions.user.face_held_pucker_lips_outwards,
            "pucker_lips_left": actions.user.face_held_pucker_lips_left,
            "pucker_lips_right": actions.user.face_held_pucker_lips_right,
        }

        if expression in action_map:
            action_map[expression]()
            return True

        return False

    # macOS Catalina+ expressions (override in context for complex logic)
    def face_held_smile():
        """Called when smile held long enough. Override in context."""

    def face_held_open_mouth():
        """Called when open_mouth held long enough. Override in context."""

    def face_held_stick_out_tongue():
        """Called when stick_out_tongue held long enough. Override in context."""

    def face_held_raise_eyebrows():
        """Called when raise_eyebrows held long enough. Override in context."""

    # macOS Big Sur+ expressions (override in context for complex logic)
    def face_held_eye_blink():
        """Called when eye_blink held long enough. Override in context."""

    def face_held_scrunch_nose():
        """Called when scrunch_nose held long enough. Override in context."""

    def face_held_pucker_lips_outwards():
        """Called when pucker_lips_outwards held long enough. Override in context."""

    def face_held_pucker_lips_left():
        """Called when pucker_lips_left held long enough. Override in context."""

    def face_held_pucker_lips_right():
        """Called when pucker_lips_right held long enough. Override in context."""
