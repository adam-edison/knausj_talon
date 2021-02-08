mode: all
-

key(keypad_enter):
    print("teams mute toggle")
    user.switcher_focus("teams")
    sleep(200ms)
    key(cmd-shift-m)