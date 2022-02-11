os: mac
-

# for items in a list in context menu or dropdown
# item 1 --> just say enter, otherwise it's the item as pictured
# TODO: AGE: override this command in azure for context menus
(item|choose) [down] <number>:
    sleep(20ms)
    key(down)
    repeat(number - 2)
    sleep(20ms)
    key(enter)

empty [down] <number>:
    key(down)
    repeat(number - 1)
    key(enter)

(item|choose) up <number>:
    key(up)
    repeat(number - 1)
    key(enter)

# created to allow multiple key and 
# insert commands to be chained without unexpected behavior

pause:
    sleep(200ms)


greet <user.text>:
    name = user.formatted_text(text, "CAPITALIZE_ALL_WORDS")
    insert("Hi, {name}.")

##############
# TODO: AGE - move these to sql programs 
execute line:
    edit.line_start()
    edit.extend_line_end()
    key("f5")

execute:
    key("f5")

copy table here:
    # left click
    mouse_click(0)
    
    # close the mouse grid if open
    user.grid_close()
    
    # select all
    key(cmd-a)

    # copy with headers
    mouse_click(1)
    sleep(50ms)
    key(up)
    key(enter)
##################

term test:
    user.switcher_focus("iterm")
    sleep(200ms)
    insert("npm run test\n")

# TODO: AGE: move to keys
goggles: ": "

jet path:
    edit.copy()
    sleep(500ms)
    user.switcher_focus("intellij")
    sleep(200ms)
    key(shift-cmd-f)
    sleep(200ms)
    key(right)
    key(cmd-a)
    key(cmd-v)

poster:
    key(cmd-enter)

dumper:
    edit.paste()
    key(cmd-enter)

(uncomment|comment) [that]:
    key(cmd-/)

jet file:
    key(cmd-c)
    sleep(100ms)
    user.switcher_focus("intellij")
    sleep(500ms)
    key(shift-cmd-o)
    sleep(1200ms)
    key(right)
    key(cmd-a)
    key(cmd-v)
    sleep(1000ms)
    key(enter)

jet file <user.text>:
    sleep(100ms)
    user.switcher_focus("intellij")
    sleep(500ms)
    key(shift-cmd-o)
    sleep(1200ms)
    key(right)
    key(cmd-a)
    user.paste("{text}")
    sleep(1000ms)
    key(enter)

copy word:
    mouse_click(0)
    mouse_click(0)
    sleep(100ms)
    edit.copy()

kill word:
    mouse_click(0)
    mouse_click(0)
    sleep(100ms)
    edit.delete()    

paste word:
    mouse_click(0)
    mouse_click(0)
    sleep(100ms)
    edit.paste()

saver:
    edit.save()

paste back:
    edit.copy()
    sleep(200ms)
    key(cmd-tab)
    sleep(200ms)
    edit.paste()

switch back:
    key(cmd-tab)

mark all as read:
    mouse_click(1)
    key(up)
    key(up)
    key(up)
    sleep(100ms)
    key(enter)

don't save:
    key(cmd-backspace)

dire up:
    insert("../")

quit this:
    key(cmd-q)

show changes:
    user.switcher_focus("intellij")
    sleep(500ms)
    key(cmd-9)

approve changes:
    key(cmd-9)
    user.switcher_focus("iterm")


waiter: 
    sleep(1000ms)

paste down:
    sleep(200ms)
    edit.paste()
    sleep(100ms)
    key(down)

link clip:
    key(cmd-k)
    sleep(200ms)
    edit.paste()

link line clip:
    key(end)
    sleep(50ms)
    key(shift-home)
    sleep(200ms)
    key(cmd-k)
    sleep(200ms)
    edit.paste()
    sleep(50ms)
    key(enter)