win.title: /- Adam \(kasa\.com\)/
-

settings():
    key_wait = 2

header <number_small>:
    key(home)
    sleep(20ms)
    insert("/h{number_small} ")

child:
    key(end)
    key(enter)
    key(tab)

sibling:
    key(end)
    key(enter)
    key(tab)

# monkey:
#     key(cmd-f)
#     sleep(300ms)
#     user.paste("⭐️")
#     key(enter)
    # sleep(10ms)
    # key(esc)
    # sleep(10ms)
    # key(end)