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
    
looks good:
    edit.save()
    sleep(200ms)
    key(escape)
    key(cmd-w)
    sleep(100ms)
    user.switcher_focus("iterm")
    
complete:
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
