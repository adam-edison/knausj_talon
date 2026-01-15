os: mac
-

timer show: key(ctrl-cmd-shift-alt-t)

timer cancel: key(ctrl-alt-r)

timer new <number> <user.text>:
    key(ctrl-cmd-shift-alt-t)
    sleep(1000ms)
    edit.select_all()
    insert("{number}m {user.text}")
    sleep(100ms)
    key(enter)
