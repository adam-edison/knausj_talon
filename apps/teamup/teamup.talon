win.title: /\| Teamup/
-

settings():
    key_wait = 5
    insert_wait = 5

# TODO: AGE: move these things to python code so they can be reused

# TODO: AGE: create a key command in python that sends the key and sleeps a configurable number of milliseconds changeable in storage 
# (retrieved from storage API, inserts default value if not present)

# TODO: AGE: start in <number> [minutes] -- using vimium

# TODO: AGE: start making multi-prompt commands (setters, actions) - e.g. create new event

# class Dog:

#     kind = 'canine'         # class variable shared by all instances

#     def __init__(self, name):
#         self.name = name    # instance variable unique to each instance

# >>> d = Dog('Fido')
# >>> e = Dog('Buddy')
# >>> d.kind                  # shared by all dogs
# 'canine'
# >>> e.kind                  # shared by all dogs
# 'canine'
# >>> d.name                  # unique to d
# 'Fido'
# >>> e.name                  # unique to e
# 'Buddy'


# Can make a multi drag and drop by:
# "group mark" (takes x,y coords of mouse)
# "group later <> [minutes]" - will loop through and drag them all, and remove them from the group

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

team complete:
    mouse_click()
    sleep(500ms)
    user.teamup_editor_set_status("complete")
    sleep(100ms)
    key(enter)

team in progress:
    mouse_click()
    sleep(500ms)
    user.teamup_editor_set_status("in progress")
    sleep(100ms)
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


# // TODO: AGE: revamp to use vimium, like complete AL, or start now AL (after having said nav to see the links)

complete <user.letter>:
    insert("{letter_1}")
    sleep(1500ms)

    # change status field to completed
    key(tab:9)
    sleep(100ms)
    key(backspace)
    insert("complete")
    key(enter)

    # save
    sleep(500ms)
    key(shift-tab)
    key(enter)

complete <user.letter> <user.letter>:
    insert("{letter_1}{letter_2}")
    sleep(1500ms)

    # change status field to completed
    key(tab:9)
    sleep(100ms)
    key(backspace)
    insert("complete")
    key(enter)

    # save
    sleep(500ms)
    key(shift-tab)
    key(enter)

delete single:
    

delete <user.letter>:
    insert("{letter_1}")
    sleep(2000ms)
    user.hover_center_image("teamup-delete-button")
    mouse_click()

delete <user.letter> <user.letter>:
    insert("{letter_1}{letter_2}")
    sleep(1500ms)
    user.hover_center_image("teamup-delete-button")
    mouse_click()

edit <user.letter> <user.letter> position <user.text>:
    insert("{letter_1}{letter_2}")
    sleep(1500ms)

    # change position field
    key(tab:10)
    sleep(100ms)
    key(backspace)
    insert("{text}")
    key(enter)

    # save
    sleep(500ms)
    key(shift-tab:2)
    key(enter)

edit <user.letter> position <user.text>:
    insert("{letter}")
    sleep(1500ms)

    # change position field
    key(tab:10)
    sleep(100ms)
    key(backspace)
    insert("{text}")
    key(enter)

    # save
    sleep(500ms)
    key(shift-tab:2)
    key(enter)

save this:
    user.hover_center_image("teamup-save-button")
    mouse_click()

agenda:
    user.mouse_move(1844, 181)
    mouse_click()

calendar {user.teamup_calendar}: user.teamup_set_to_calendar(teamup_calendar)

mark complete:
    key(home)
    sleep(100ms)
    user.paste("✅ ")

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

talon work [{user.teamup_position}] [<number>]:
    position = teamup_position or "sitting"
    duration = number or 20
    user.teamup_event_sprint_work(position, duration)

sprint work [{user.teamup_position}] [<number>]:
    position = teamup_position or "sitting"
    duration = number or 25
    user.teamup_event_sprint_work(position, duration)

tomorrow [<number>]$:
    mouse_click(0)
    sleep(1000ms)

    # tomorrow
    key(tab)
    sleep(50ms)
    insert(user.date_slash_format(1))

    # midnight is 0000am
    time = number or "0000am"
    key(tab)
    sleep(50ms)
    insert(time)
    sleep(50ms)
    key(tab)

    # save
    user.teamup_save()

longer <number> [minutes]:
    user.mouse_down(0)
    sleep(200ms)
    adjustment = 3 * number
    user.mouse_move_relative(0, adjustment)
    sleep(200ms)
    user.mouse_up(0)

earlier <number> [minutes]:
    user.teamup_drag_event(number, "up")

later <number> [minutes]:
    user.teamup_drag_event(number, "down")

later <number> (hour|hours):
    user.mouse_down(0)
    sleep(800ms)
    adjustment = 240 * number
    user.mouse_move_relative(0, adjustment)
    sleep(500ms)
    user.mouse_up(0)

next <number> [minutes]:
    adjustment = 4 * number
    user.mouse_move_relative(0, adjustment)

stop now:
    now = user.time_12h(5)
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

# TODO: add "in progress now", basically {status} now
# TODO: add "in progress now plus []", basically {status} now plus []

start now$:
    now = user.time_12h(5)
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

start [now] plus <number> [minutes]:
    print("starting plus number")
    now = user.time_12h(5, number)
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

# TODO: AGE: add a start at four pm or 3 am or whatever - needs python

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

<number> future here:
    mouse_click(0)
    sleep(1000ms)

    # time
    key(tab:2)
    sleep(50ms)
    insert("{number}")
    sleep(50ms)
    key(tab)

    # save
    key(cmd-s)
    sleep(500ms)

    # future
    key(shift-cmd-f)


buffer time:
    insert("Buffer Time")
    key(tab:7)
    key(backspace:3)
    insert("Buffer\n\t\t")
    insert("Planned\n")

    # save
    key(cmd-s)

buffer time daily:
    insert("Buffer Time")
    key(tab:7)
    key(backspace:3)
    insert("Buffer\n\t\t")
    insert("Planned\n")
    key(shift-tab:9)

    # daily
    key(tab:6)
    sleep(10ms)
    key(space)
    sleep(10ms)
    key(shift-tab:6)
    sleep(100ms)

    # save
    key(cmd-s)

work ({user.teamup_position}| block):
    position = user.teamup_position or "Sitting"
    insert("Work")
    key(tab:7)
    key(backspace:3)
    insert("Job\n\t\t")
    insert("Planned\n\t")
    insert("{position}\n")

    # save
    key(shift-tab:2)
    key(enter)

meeting [{user.teamup_position}]:
    position = user.teamup_position or "Sitting"
    insert("Work Meeting")
    key(tab:7)
    key(backspace:3)
    insert("Job\n\t\t")
    insert("Planned\n\t")
    insert("{position}\n")

    # save
    key(shift-tab:2)
    key(enter)

clear marks: user.teamup_clear_image_locations()

positively confirm delete:
    user.teamup_delete_menu()

positively confirm delete future:
    user.teamup_delete_menu()
    sleep(500ms)
    user.teamup_click_future()

undo that:
    user.teamup_undo_toast()

duplicate {user.teamup_calendar}:
    user.teamup_duplicate_event(teamup_calendar)

# TODO: view planned, view all - calling custom js shortcuts to focus the status field

########################################################
# These commands assume the edit window is already open
########################################################
[status] {user.teamup_status}: user.teamup_editor_set_status(teamup_status)

[calendar] {user.teamup_calendar}: user.teamup_editor_set_calendar(teamup_calendar)

[repeat] daily:
    key(tab:6)
    key(space)
    key(shift-tab:6)

saver:
    key(enter)


#############################################################################
# When prompted (modal is visible), assuming custom js is injected into page
#     ( see https://github.com/adam-edison/custom-javascript-chrome-snippets )
#############################################################################

[apply] single: key(shift-cmd-s)

[apply] future: key(shift-cmd-f)

[apply] all: key(shift-cmd-a)

show day:
    today = user.date_dash_format()
    user.open_link_current_tab("https://teamup.com/c/moqsyr/personal?refresh=10&tz=America%2FNew_York&view=D&date={today}&filterby_status[]=planned")
