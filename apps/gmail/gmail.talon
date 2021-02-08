win.title: /Gmail/
-

board table:
    user.mouse_move(499, 541)
    sleep(100ms)
    mouse_click(0)

inbox: "gi"
shortcuts: "?"
archive: "e"
next message: key(enter)
archive next:
    key(enter)
    sleep(500ms)
    key(e)
    sleep(100ms)