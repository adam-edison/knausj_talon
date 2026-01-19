mode: face
and not mode: sleep
-

# Face action parameters:
#   face_*_start(grace_ms, tap_window_ms, required_taps)
#     grace_ms: delay before action triggers (filters accidental holds)
#     tap_window_ms: time window for multi-tap confirmation (0 = single tap)
#     required_taps: number of taps required within window (default 1)

# eyebrows raised -> continuous scroll up
# Double-tap within 800ms, then 300ms grace before scrolling starts
face(raise_eyebrows:start): user.face_scroll_up_start(300, 800, 2)
face(raise_eyebrows:stop): user.face_scroll_up_stop()

# smile -> continuous scroll down
# Double-tap within 800ms, then 300ms grace before scrolling starts
face(smile:start): user.face_scroll_down_start(300, 800, 2)
face(smile:stop): user.face_scroll_down_stop()

# scroll speed control (1-50, default 8)
scroll speed <number_small>: user.face_scroll_speed_set(number_small)
scroll faster: user.face_scroll_speed_set(user.face_scroll_speed_get() + 4)
scroll slower: user.face_scroll_speed_set(user.face_scroll_speed_get() - 4)

face off: mode.disable("face")

# blink right -> toggle control mouse
# Double-tap within 1000ms, then 500ms grace before toggle
face(blink_right:start): user.face_control_mouse_start(500, 1000, 2)
face(blink_right:stop): user.face_control_mouse_stop()

# blink left -> mouse click
# Double-tap within 800ms, then 300ms grace before click
face(blink_left:start): user.face_click_start(300, 800, 2)
face(blink_left:stop): user.face_click_stop()
