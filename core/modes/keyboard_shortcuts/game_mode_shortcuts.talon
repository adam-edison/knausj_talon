mode: user.game
-

key(keypad_minus):
    speech.disable()
    sound.set_microphone("None")

key(keypad_plus):
    speech.enable()
    sound.set_microphone("Default")
