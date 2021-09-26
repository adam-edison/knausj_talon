app: Azure Data Studio
-

copy results:
    key(alt-cmd-c)

clone line:
    key(end)
    sleep(100ms)
    key(shift-home)
    sleep(100ms)
    key(cmd-c)
    sleep(100ms)
    key(end)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    key(cmd-v)

refresh intellisense:
    key(cmd-shift-p)
    sleep(200ms)
    insert("intellisense")
    sleep(500ms)
    key(enter)