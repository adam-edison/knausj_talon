app: todoist
-

task time [estimate] <number>:
    # click on task
    mouse_click()
    sleep(500ms)

    # edit task
    key(cmd-e)
    sleep(500ms)

    # add time
    key(end)
    sleep(50ms)
    insert(" [{number}m]")
    sleep(100ms)

    # save task
    key(cmd-enter)
    sleep(100ms)
    key(esc)

time [estimate] <number>:
    edit.line_end()
    insert(" [{number}m]")
    sleep(100ms)

task order <user.number_string>:
    # click on task
    mouse_click()
    sleep(500ms)

    # edit task
    key(cmd-e)
    sleep(500ms)

    # add order prefix
    key(home)
    sleep(200ms)
    insert("{number_string} ")
    sleep(100ms)

    # save task
    key(cmd-enter)
    sleep(100ms)
    key(esc)

order <user.number_string>:
    key(home)
    sleep(100ms)
    insert("{number_string} ")
    sleep(300ms)

label <user.word>:
    key(home)
    insert("@{word}")
    sleep(300ms)
    key(enter)

project <user.word>:
    key(home)
    insert("#{word}")
    sleep(300ms)
    key(enter)

add task: key(q)

hunt <word>:
    key(cmd-k)
    sleep(200ms)
    insert("{word}")

priority <number_small>:
    key(end)
    insert(" p{number_small} ")

task label <user.word>:
    # click on task
    mouse_click()
    sleep(500ms)

    # edit labels
    key(l)
    sleep(300ms)

    # toggle label
    insert("{word}")
    sleep(200ms)
    key(enter)

    # save task
    sleep(200ms)
    key(esc)
    sleep(200ms)
    key(esc)
