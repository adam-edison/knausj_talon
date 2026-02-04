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
    insert(text)
    key(enter)
    sleep(100ms)
    key(esc)

# requires keyboard shortcut defined in iterm settings
pane new [vertical]: key(shift-alt-cmd-n)

pane <number_small>: user.pane_jump(number_small)

jump <number_small> <number_small>: user.pane_jump_into(number_small_1, number_small_2)