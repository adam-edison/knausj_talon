os: mac
app: iterm2
-
tag(): terminal
# todo: filemanager support
#tag(): user.file_manager
tag(): user.generic_unix_shell
tag(): user.git
tag(): user.kubectl
tag(): user.tabs
tag(): user.readline

follower:
    key(cmd:down)
    mouse_click()
    key(cmd:up)

session <user.text>:
    key(cmd-i)
    sleep(100ms)
    key(tab:2)
    insert(text)
    key(enter)
    sleep(100ms)
    key(esc)

# Parrot: tih = tab next, kuh = tab last (previous)
parrot(tih): app.tab_next()
parrot(kuh): app.tab_previous()

# requires keyboard shortcut defined in iterm settings
pane new [vertical]: key(shift-alt-cmd-n)

pane (max | min): key(shift-cmd-enter)

jump <number_small> <number_small>: user.pane_jump_into(number_small_1, number_small_2)

arrangement restore: key(shift-cmd-r)