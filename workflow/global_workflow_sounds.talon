mode: command
mode: dictation
-
# Scrolling sounds
parrot(sss):      user.sound_scroll_up_start(300)
parrot(sss:stop): user.sound_scroll_up_stop()
parrot(shh):      user.sound_scroll_down_start(300)
parrot(shh:stop): user.sound_scroll_down_stop()

# Sound mode select: spit opens the mode menu
parrot(spit): user.sound_mode_select_toggle()
