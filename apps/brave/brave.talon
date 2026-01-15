app: brave
-
tag(): browser
tag(): user.tabs

window <user.text>:
    key(cmd-shift-a)
    sleep(300ms)
    insert(text)
    key(enter)

window <number>:
    key(cmd-shift-a)
    sleep(300ms)
    insert("{number}")
    key(enter)
