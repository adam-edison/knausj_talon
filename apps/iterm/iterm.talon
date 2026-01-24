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