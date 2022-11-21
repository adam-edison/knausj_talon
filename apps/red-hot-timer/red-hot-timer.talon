os: mac
-

key(keypad_0):
    key(ctrl-shift-cmd-alt-r)

(times up|shut up):
    key(ctrl-shift-cmd-alt-r)

^[time] block <number> [<user.text>]$:
    title = text or ""
    formatted = user.formatted_text(title, "CAPITALIZE_ALL_WORDS")
    user.red_hot_timer_set(number)
    key(esc)
    user.text_edit_caption(formatted)

^[time] block <number> line$:
    text = user.line_copy()
    user.red_hot_timer_set(number)
    key(esc)
    user.text_edit_caption(text)
