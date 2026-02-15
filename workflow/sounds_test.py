"""
Sound testing with timestamps.

Logs parrot sounds as they are detected. Used by workflow/sounds_test.talon;
output is written to workflow/sounds_test.log (same directory as this script).
"""

import os
from datetime import datetime
from talon import Module

mod = Module()
mod.mode("sound_test", desc="Sound test mode - logs parrot sounds to sounds_test.log")

# Log file: sounds_test.log (cross-ref: sounds_test.talon)
_LOG_FILE = os.path.join(os.path.realpath(os.path.dirname(__file__)), "sounds_test.log")


def _timestamp() -> str:
    """Return current timestamp in HH:MM:SS.mmm format."""
    now = datetime.now()
    return now.strftime("%H:%M:%S.") + f"{now.microsecond // 1000:03d}"


def _log(message: str):
    """Write message to log file."""
    try:
        with open(_LOG_FILE, "a") as f:
            f.write(message + "\n")
            f.flush()
    except OSError as e:
        from talon import actions

        actions.app.notify(f"Sound test log write failed: {e}")


@mod.action_class
class Actions:
    def sound_test_log(sound: str):
        """Log a detected sound."""
        _log(f"[{_timestamp()}] {sound}")

    def sound_test_clear_log():
        """Clear the sound test log file."""
        with open(_LOG_FILE, "w") as f:
            f.write(f"[{_timestamp()}] Log cleared\n")
            f.write(f"# Log file: {_LOG_FILE}\n")