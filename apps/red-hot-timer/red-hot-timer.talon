os: mac
-

(times up|shut up):
    key(ctrl-shift-cmd-alt-r)

^block <number> [<user.text>]$:
    title = text or ""
    key(ctrl-shift-alt-cmd-t)
    sleep(200ms)
    insert("{number}m {title}")
    sleep(500ms)
    key(enter)