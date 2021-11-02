win.title: /Confluence/
-
settings():
    key_wait = 2

mark complete:
    key(home)
    insert(":white_check")
    sleep(300ms)
    key(enter)

mark skipped:
    key(home)
    sleep(200ms)
    insert(":fast_for:")
    sleep(100ms)
    key(enter)

mark clear:
    key(home)
    sleep(200ms)
    key(delete)

mark space:
    key(home)
    sleep(10ms)
    key(home)
    sleep(10ms)
    key(end)
    sleep(100ms)
    key(left)
    key(space)
    key(left)    

mark (in progress|working):
    key(home)
    sleep(200ms)
    insert(":construction:")
    sleep(100ms)