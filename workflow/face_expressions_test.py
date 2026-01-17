"""
Face expression testing with timestamps.

Logs expressions held for 300ms+ with total hold duration.
"""

import os
from datetime import datetime
from talon import Module

mod = Module()

# Log file path - in the same directory as this script
_LOG_FILE = os.path.join(os.path.dirname(__file__), "face_expressions_test.log")

# Track when each expression started
_start_times: dict[str, float] = {}

# Minimum hold time to log
_MIN_MS = 300


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
    def face_test_start(expression: str, delay_ms: int = 300):
        """Record when a face expression starts."""
        _start_times[expression] = datetime.now().timestamp()

    def face_test_stop(expression: str):
        """Log expression if held >= 300ms, with total duration."""
        if expression in _start_times:
            start_time = _start_times.pop(expression)
            elapsed = (datetime.now().timestamp() - start_time) * 1000
            if elapsed >= _MIN_MS:
                _log(f"[{_timestamp()}] {expression} ({elapsed:.0f}ms)")

    def face_test_clear_log():
        """Clear the face expression test log file."""
        with open(_LOG_FILE, "w") as f:
            f.write(f"[{_timestamp()}] Log cleared\n")
