os: windows
-


key(ctrl-f1):
    user.switcher_focus("Discord")
    sleep(500ms)
    key(ctrl-shift-m)
    sleep(1000ms)
    key(alt-tab)

key(ctrl-f2):
    speech.enable()

key(ctrl-f3):
    speech.disable()