mode: command
-
focus {user.quick_tabs_keywords}: 
    user.switcher_focus("chrome")
    sleep(200ms)
    key(alt-q)
    sleep(300ms)
    key(cmd-a)
    key(delete)
    insert(quick_tabs_keywords)
    sleep(300ms)
    key(enter)

focus <number>:
    user.switcher_focus("chrome")
    sleep(200ms)
    key(alt-q)
    sleep(300ms)
    key(cmd-a)
    key(delete)
    insert("{number}")
    sleep(100ms)
    key(enter)