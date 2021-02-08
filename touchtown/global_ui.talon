# for items in a list in context menu or dropdown
# item 1 --> just say enter, otherwise it's the item as pictured
# TODO: AGE: override this command in azure for context menus
(item|choose) [down] <number>:
    key(down)
    repeat(number - 2)
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

term run last:
    user.switcher_focus("iterm")
    sleep(100ms)
    key(up)
    key(enter)

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

(post|save comment):
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


# Yes, you can make whatever modes you want
# mod.mode("x", desc="some game")
# Then user.x is the mode name

(show|hide) changes:
    user.switcher_focus("intellij")
    sleep(500ms)
    key(cmd-9)

focus task:
    user.mouse_move(2432, 57)
    mouse_click(0)

wait: sleep(500ms)

plunger:
    key(pagedown)
    sleep(250ms)

riser:
    key(pageup)
    sleep(250ms)

stamp below:
    edit.copy()
    sleep(50ms)
    key(down)
    edit.paste()