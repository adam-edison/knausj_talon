os: mac
-

(times up|shut up):
    key(ctrl-alt-r)

block [<user.text>] <number>:
    title = text or ""
    key(ctrl-shift-alt-cmd-t)
    sleep(200ms)
    insert("{number}m {title}")
    sleep(500ms)
    key(enter)
    sleep(5000ms)
    key(esc)