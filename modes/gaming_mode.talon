mode: user.gaming
-
^command mode$:
    print("switching to command mode")
    mode.disable("sleep")
    mode.disable("user.gaming")
    mode.disable("dictation")
    mode.enable("command")