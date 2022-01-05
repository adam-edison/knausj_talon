os: mac
mode: all
-
key(keypad_minus):
    speech.set_microphone("None")
    speech.disable()
    user.mouse_sleep()
    mode.disable("face")

key(keypad_plus):
    speech.set_microphone("CORSAIR HS60 HAPTIC Gaming Headset")
    speech.enable()

key(keypad_multiply):
    speech.set_microphone("MacBook Pro Microphone")
    speech.enable()

key(keypad_divide):
    speech.set_microphone("HD Webcam C615")
    speech.enable()