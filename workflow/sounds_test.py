"""
Sound testing with timestamps.

Logs parrot sounds as they are detected.
"""

import os
from datetime import datetime
from talon import Module

mod = Module()

# Log file path - in the same directory as this script
_LOG_FILE = os.path.join(os.path.dirname(__file__), "sounds_test.log")


def _timestamp() -> str:
    """Return current timestamp in HH:MM:SS.mmm format."""
    now = datetime.now()
    return now.strftime("%H:%M:%S.") + f"{now.microsecond // 1000:03d}"


def _log(message: str):
    """Write message to log file."""
    with open(_LOG_FILE, "a") as f:
        f.write(message + "\n")
        f.flush()


@mod.action_class
class Actions:
    def sound_test_log(sound: str):
        """Log a detected sound."""
        _log(f"[{_timestamp()}] {sound}")

    def sound_test_clear_log():
        """Clear the sound test log file."""
        with open(_LOG_FILE, "w") as f:
            f.write(f"[{_timestamp()}] Log cleared\n")
