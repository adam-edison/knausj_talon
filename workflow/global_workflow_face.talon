mode: face
and mode: command
and not mode: sleep
-

# eyebrows raised -> continuous scroll up (starts after 500ms grace period)
face(raise_eyebrows:start): user.face_scroll_up_start(500)
face(raise_eyebrows:stop): user.face_scroll_up_stop()

# smile -> continuous scroll down (starts after 500ms grace period)
face(smile:start): user.face_scroll_down_start(500)
face(smile:stop): user.face_scroll_down_stop()

# scroll speed control (1-50, default 8)
scroll speed <number_small>: user.face_scroll_speed_set(number_small)
scroll faster: user.face_scroll_speed_increase()
scroll slower: user.face_scroll_speed_decrease()

face off: mode.disable("face")

# pucker lips -> toggle control mouse (after 500ms hold)
# face(pucker_lips_outwards:start): user.face_control_mouse_start(500)
# face(pucker_lips_outwards:stop): user.face_control_mouse_stop()

# blink -> mouse click (after 600ms hold)
face(blink:start): user.face_click_start(600)
face(blink:stop): user.face_click_stop()
