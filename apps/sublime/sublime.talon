app: sublime
-
tag(): user.find_and_replace
tag(): user.line_commands

force close:
    key(cmd-w)
    sleep(500ms)
    key(cmd-backspace)
    
saver:
    edit.save()
    sleep(200ms)
    key(escape)
    
commit it:
    edit.save()
    sleep(200ms)
    key(escape)
    key(cmd-w)
    sleep(100ms)
    user.switcher_focus("iterm")

ship it:
    edit.save()
    sleep(200ms)
    key(escape)
    key(cmd-w)
    sleep(100ms)
    user.switcher_focus("iterm")
    sleep(100ms)
    insert("git push\n")
    
mark complete:
    key(home)
    sleep(100ms)
    key(right:3)
    sleep(50ms)
    key(delete)
    sleep(50ms)
    insert("x")
    sleep(100ms)
    edit.save()
    sleep(200ms)
    key(esc)

mark clear:
    key(home)
    sleep(10ms)
    key(right:2)
    sleep(10ms)
    key(delete:4)
