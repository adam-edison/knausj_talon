win.title: /Teamup/
-

# TODO: AGE: move these things to python code so they can be reused
# TODO: AGE: start here now: """set start time to now for the calendar event currently under the mouse pointer"""

# TODO: AGE: create a key command in python that sends the key and sleeps a configurable number of milliseconds changeable in storage 
# (retrieved from storage API, inserts default value if not present)
    

complete:
    key(home)
    sleep(100ms)
    user.paste("✅")
    sleep(100ms)
    key(space:2)

hide completed:
    # hide completed, because it toggles on...
    user.mouse_move(115, 438)
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

complete here:
    # rewrite in python so we can detect "Single" window
    # click the mouse to select the event and bring up details
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

delete here [single]:
    mouse_click()
    user.mouse_move(1199, 413)
    mouse_click()
    sleep(300ms)
    user.mouse_move(1030, 370)
    mouse_click()

delete future here:
    mouse_click()
    user.mouse_move(1199, 413)
    mouse_click()
    sleep(300ms)
    # TODO: AGE: finished this by clicking on the future button

delete this [single]:
    user.mouse_move(1199, 413)
    mouse_click()
    sleep(300ms)
    user.mouse_move(1030, 370)
    mouse_click()

future events:
    user.hover_center_image("teamup-future-events")
    mouse_click()

save this:
    user.hover_center_image("teamup-save-button")
    mouse_click()

agenda:
    user.mouse_move(1844, 181)
    mouse_click()

work save:
    key(tab:7)
    sleep(10ms)
    key(backspace)
    insert("work\n")
    sleep(100ms)
    key(tab)
    sleep(10ms)
    key(enter)

(update|reload): key(r)