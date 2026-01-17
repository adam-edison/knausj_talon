mode: face
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
scroll faster: user.face_scroll_speed_set(user.face_scroll_speed_get() + 4)
scroll slower: user.face_scroll_speed_set(user.face_scroll_speed_get() - 4)

face off: mode.disable("face")
