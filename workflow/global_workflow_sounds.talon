mode: command
-
settings():
    user.parrot_config_combo_window = 500

parrot(sss):      user.sound_scroll_up_start(300)
parrot(sss:stop): user.sound_scroll_up_stop()
parrot(shh):      user.sound_scroll_down_start(300)
parrot(shh:stop): user.sound_scroll_down_stop()
parrot(puh):      user.parrot_config_noise("puh")
parrot(clop):     user.parrot_config_noise("clop")

