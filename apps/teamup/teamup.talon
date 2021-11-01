win.title: /\| Teamup/
-

settings():
    key_wait = 2

# TODO: AGE: move these things to python code so they can be reused
# TODO: AGE: start here now: """set start time to now for the calendar event currently under the mouse pointer"""

# TODO: AGE: create a key command in python that sends the key and sleeps a configurable number of milliseconds changeable in storage 
# (retrieved from storage API, inserts default value if not present)


hide completed:
    # hide completed, because it toggles on...
    user.mouse_move(115, 480)
    sleep(100ms)
    mouse_click()

description [line] [<number>]:
    line = number or 0
    moves = line - 1
    key(tab:10)
    sleep(100ms)
    key("down:{moves}")

complete single:
    mouse_click()
    sleep(1000ms)
    
    # change calendar to completed
    key(tab:7)
    sleep(100ms)
    key(backspace:2)
    insert("completed")
    key(enter)

    # save
    sleep(500ms)
    key(tab)
    key(enter)

    # choose single when window comes up
    sleep(1500ms)
    key(tab)
    key(enter)

make this work:
    insert("Work")
    key(tab:7)
    sleep(100ms)
    key(backspace:2)
    insert("work")
    key(enter)

    # save
    sleep(500ms)
    key(tab)
    key(enter)


# // TODO: AGE: revamp to use vim um, like complete AL, or start now AL (after having said nav to see the links)

complete <user.letter>:
    insert("{letter_1}")
    sleep(1500ms)

    # change calendar to completed
    key(tab:7)
    sleep(100ms)
    key(backspace:2)
    insert("completed")
    key(enter)

    # save
    sleep(500ms)
    key(tab)
    key(enter)

    # hide completed calendar
    sleep(2000ms)
    user.mouse_move(72, 477)
    mouse_click()

complete <user.letter> <user.letter>:
    insert("{letter_1}{letter_2}")
    sleep(1500ms)

    # change calendar to completed
    key(tab:7)
    sleep(100ms)
    key(backspace:2)
    insert("completed")
    key(enter)

    # save
    sleep(500ms)
    key(tab)
    key(enter)

    # hide completed calendar
    sleep(2000ms)
    user.mouse_move(72, 477)
    mouse_click()


complete this:
    # change calendar to completed
    key(tab:7)
    sleep(100ms)
    key(backspace:2)
    insert("completed")
    key(enter)

    # save
    sleep(500ms)
    key(tab)
    key(enter)

    # hide completed calendar
    sleep(2000ms)
    user.mouse_move(72, 477)
    mouse_click()

completer:
    # rewrite in python so we can detect "Single" window
    # click the mouse to select the event and bring up details
    mouse_click()
    user.store_set_mouse_position("talon trigger completer")
    sleep(1000ms)
    
    # change calendar to completed
    key(tab:7)
    sleep(100ms)
    key(backspace:2)
    insert("completed")
    key(enter)

    # save
    sleep(500ms)
    key(tab)
    key(enter)

    # hide completed calendar
    sleep(1500ms)
    user.mouse_move(72, 477)
    mouse_click()

    # move mouse back to where it was
    position = user.store_get_mouse_position("talon trigger completer")
    user.mouse_move_position(position)


delete here [single]:
    mouse_click()
    sleep(500ms)
    user.hover_center_image("teamup-delete-button")
    mouse_click()


future:
    user.hover_center_image("teamup-future-events")
    mouse_click()

save this:
    user.hover_center_image("teamup-save-button")
    mouse_click()

agenda:
    user.mouse_move(1844, 181)
    mouse_click()

set {user.calendar}: user.set_to_calendar(user.calendar)

mark complete:
    key(home)
    sleep(100ms)
    user.paste("✅")
    sleep(100ms)
    key(space:2)

mark skipped:
    key(home)
    sleep(100ms)
    user.paste("⏩")
    key(space)

mark in progress:
    key(home)
    sleep(100ms)
    user.paste("🚧")
    key(space)
    
mark clear:
    key(home)
    sleep(200ms)
    key(delete:2)


sprint work standing:
    insert("Sprint Work - Standing")
    key(tab:9)
    insert("Planned\n")

sprint work:
    insert("Sprint Work")
    key(tab:9)
    insert("Planned\n")
    key(tab)
    insert("Sitting\n")

tomorrow midnight:
    mouse_click(0)
    sleep(1000ms)

    # tomorrow
    key(tab)
    sleep(50ms)
    insert(user.date_slash_format(1))

    # midnight
    key(tab)
    sleep(50ms)
    insert("0000am")
    sleep(50ms)
    key(tab)

    # save
    sleep(200ms)
    key(tab:5)
    sleep(50ms)
    key(enter)
    
single:
    user.hover_center_image("teamup-single")
    mouse_click()


earlier <number> [minutes]:
    user.mouse_down(0)
    sleep(500ms)
    adjustment = -3 * number
    user.mouse_move_relative(0, adjustment)
    sleep(500ms)
    user.mouse_up(0)

later <number> [minutes]:
    user.mouse_down(0)
    sleep(500ms)
    adjustment = 4 * number
    user.mouse_move_relative(0, adjustment)
    sleep(500ms)
    user.mouse_up(0)

later <number> (hour|hours):
    user.mouse_down(0)
    sleep(500ms)
    adjustment = 240 * number
    user.mouse_move_relative(0, adjustment)
    sleep(500ms)
    user.mouse_up(0)

stop now:
    now = user.time_now_12h(5)
    today = user.date_slash_format()

    mouse_click(0)
    sleep(1000ms)

    # today
    key(tab:3)
    sleep(50ms)
    insert(today)

    # now
    key(tab)
    sleep(50ms)
    insert(now)
    sleep(50ms)
    key(tab)

    # save
    sleep(200ms)
    key(tab:4)
    sleep(50ms)
    key(enter)

start now:
    now = user.time_now_12h(5)
    today = user.date_slash_format()

    mouse_click(0)
    sleep(1000ms)

    # today
    key(tab)
    sleep(50ms)
    insert(today)

    # now
    key(tab)
    sleep(50ms)
    insert(now)
    sleep(50ms)
    key(tab)

    # save
    sleep(200ms)
    key(tab:5)
    sleep(50ms)
    key(enter)

start oh <number>:
    today = user.date_slash_format()

    mouse_click(0)
    sleep(1000ms)

    # today
    key(tab)
    sleep(50ms)
    insert(today)

    # now
    key(tab)
    sleep(50ms)
    insert("0{number}")
    sleep(50ms)
    key(tab)

    # save
    sleep(200ms)
    key(tab:5)
    sleep(50ms)
    key(enter)

start double oh <number>:
    today = user.date_slash_format()

    mouse_click(0)
    sleep(1000ms)

    # today
    key(tab)
    sleep(50ms)
    insert(today)

    # now
    key(tab)
    sleep(50ms)
    insert("00{number}")
    sleep(50ms)
    key(tab)

    # save
    sleep(200ms)
    key(tab:5)
    sleep(50ms)
    key(enter)

start <number>:
    today = user.date_slash_format()

    mouse_click(0)
    sleep(1000ms)

    # today
    key(tab)
    sleep(50ms)
    insert(today)

    # now
    key(tab)
    sleep(50ms)
    insert("{number}")
    sleep(50ms)
    key(tab)

    # save
    sleep(200ms)
    key(tab:5)
    sleep(50ms)
    key(enter)

# // TODO: AGE: fix scrolling in general, allowing for a natural or normal scrolling variable
# // TODO: AGE: extract this scroll down function in order to re use it across multiple applications, center_scroll_down
scroll down:
    user.mouse_move(671, 441)
    sleep(200ms)
    user.mouse_scroll_up()
    repeat(2)

scroll up:
    user.mouse_move(671, 441)
    sleep(200ms)
    user.mouse_scroll_down()
    repeat(2)   


# TODO: AGE: add a start at four pm or 3 am or whatever - needs python