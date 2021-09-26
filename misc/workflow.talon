os: mac
-
transfer last:
    edit.copy()
    sleep(100ms)
    key(cmd-tab)
    sleep(200ms)
    edit.paste()

focus last:
    key(cmd-tab)

sublime task list:
    user.switcher_focus("sublime")
    sleep(100ms)
    key(cmd-p)
    sleep(40ms)
    insert(".md")
    sleep(40ms)
    key(enter)