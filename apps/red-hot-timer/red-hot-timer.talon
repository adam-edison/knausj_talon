os: mac
-

(times up|shut up):
    key(ctrl-shift-cmd-alt-r)

^block <number> [<user.text>]$:
    title = text or ""
    formatted = user.formatted_text(title, "CAPITALIZE_ALL_WORDS")
    user.red_hot_timer_set(number)
    user.text_edit_caption(formatted)

^block <number> line$:
    text = user.line_copy()
    user.red_hot_timer_set(number)
    user.text_edit_caption(text)
