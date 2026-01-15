os: mac
win.title: /Google Sheets/
-

clone line:
    key(end)
    key(shift-home)
    key(cmd-c)
    key(end)
    key(alt-enter)
    key(cmd-v)

go <user.letter> <number>:
    key(ctrl-g)
    sleep(200ms)
    insert("{letter}{number}")
    key(enter)
