# Voice-driven screenshot selection that bypasses macOS modal screenshot mode
# Usage: Position cursor at corner, say "grab start", move to opposite corner, say "grab it"

grab start: user.screenshot_mark_start()
grab (it | end): user.screenshot_capture_selection()
grab cancel: user.screenshot_cancel_selection()
