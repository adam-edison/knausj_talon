not tag: user.screenshot_disabled
-

# Default: clipboard. Say "file" to save to a file.
^grab screen$: user.screenshot_clipboard()
^grab screen file$: user.screenshot()
^grab screen <number_small>$: user.screenshot_clipboard(number_small)
^grab screen <number_small> file$: user.screenshot(number_small)
^grab window$: user.screenshot_window_clipboard()
^grab window file$: user.screenshot_window()
^grab selection$: user.screenshot_selection_clip()
^grab selection file$: user.screenshot_selection()
^grab settings$: user.screenshot_settings()
