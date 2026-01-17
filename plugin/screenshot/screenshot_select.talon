# Voice-driven screenshot selection that bypasses macOS modal screenshot mode
# Usage: Position cursor at corner, say "shot start", move to opposite corner, say "shot it"

shot start: user.screenshot_mark_start()
shot (it | end): user.screenshot_capture_selection()
shot cancel: user.screenshot_cancel_selection()
