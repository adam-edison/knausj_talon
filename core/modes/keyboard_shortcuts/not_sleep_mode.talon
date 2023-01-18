not mode: sleep
-

key(keypad_minus):
  speech.disable()
  user.mouse_sleep()

key(keypad_multiply):
  user.mouse_toggle_control_mouse()
  user.mouse_toggle_zoom_mouse()

key(keypad_divide):
  # keeps tracker on while looking around
  user.mouse_toggle_control_mouse()