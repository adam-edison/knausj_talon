os: mac
-

(times up|shut up):
    key(ctrl-shift-cmd-alt-r)

^block <number> [<user.text>]$:
    title = text or ""
    formatted = user.formatted_text(title, "CAPITALIZE_ALL_WORDS")
    key(ctrl-shift-alt-cmd-t)
    sleep(200ms)
    insert("{number}m")
    sleep(500ms)
    key(enter)
    sleep(100ms)
    user.switcher_focus("textedit")
    sleep(200ms)
    edit.delete_line()
    insert("{formatted}")