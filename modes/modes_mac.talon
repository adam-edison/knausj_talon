mode: all
-
key(keypad_minus):
    speech.set_microphone("None")
    speech.disable()
    user.mouse_sleep()
    mode.disable("face")

key(cmd-ctrl-f2):
    speech.set_microphone("None")
    speech.disable()
    user.mouse_sleep()
    mode.disable("face")

key(keypad_plus):
    speech.set_microphone("CORSAIR HS60 HAPTIC Gaming Headset")
    mode.enable("face")
    speech.enable()

key(keypad_multiply):
    speech.set_microphone("MacBook Pro Microphone")
    mode.enable("face")
    speech.enable()

key(cmd-ctrl-f1):
    speech.set_microphone("CORSAIR HS60 HAPTIC Gaming Headset")
    mode.enable("face")
    speech.enable()

# *****