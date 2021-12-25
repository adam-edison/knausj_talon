os: windows
-


key(f1):
    user.switcher_focus("Discord")
    sleep(100ms)
    key(ctrl-shift-m)
    sleep(100ms)
    key(alt-tab)

key(ctrl-f1):
    speech.enable()

key(ctrl-f2):
    speech.disable()