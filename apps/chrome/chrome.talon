app: chrome
-
tag(): browser
tag(): user.tabs
tag(): user.emoji

profile switch: user.chrome_mod("shift-m")

tab search: user.chrome_mod("shift-a")

tab search <user.text>$:
    user.chrome_mod("shift-a")
    sleep(200ms)
    insert("{text}")
    key(down)

tab clip:
    app.tab_open()
    sleep(200ms)
    edit.paste()
    key(enter)
