mode: all
-
key(keypad_minus):
    speech.set_microphone("None")
    speech.disable()
    user.mouse_sleep()
    mode.disable("face")

key(keypad_multiply):
    user.mouse_toggle_control_mouse()
    user.mouse_toggle_zoom_mouse()

key(keypad_divide):
    # keeps tracker on while looking around
    user.mouse_toggle_control_mouse()

key(keypad_plus):
    speech.set_microphone("CORSAIR HS60 HAPTIC Gaming Headset")
    mode.enable("face")
    speech.enable()

# *****