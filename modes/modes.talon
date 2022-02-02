not mode: sleep
-
welcome back:
    user.mouse_wake()
    user.history_enable()
    user.talon_mode()
sleep all:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    user.engine_sleep()
(talon sleep|nap time): speech.disable()
(talon wake|wake up): speech.enable()

microphone off:
    user.switcher_hide_running()
    user.history_disable()
    user.homophones_hide()
    user.help_hide()
    user.mouse_sleep()
    speech.disable()
    user.engine_sleep()
    speech.set_microphone("None")

# begin: these commands are really for windows & mac with Dragon.
dragon mode: user.dragon_mode()
talon mode: user.talon_mode()
# end: these commands are really for windows & mac on Dragon.
^dictation mode$:
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("dictation")
    user.code_clear_language_mode()
    mode.disable("user.gdb")
^command mode$:
    app.notify("switching to command mode")
    mode.disable("sleep")
    mode.disable("user.gaming")
    mode.disable("dictation")
    mode.enable("command")
^gaming mode$:
    app.notify("switching to gaming mode")
    mode.disable("sleep")
    mode.disable("command")
    mode.enable("user.gaming")

# hello <user.text>$:
#     mode.disable("command")
#     mode.enable("dictation")
#     auto_insert(text)

# hello <user.text> over:
#     user.dictation_insert(text)


# Yes, you can make whatever modes you want
# mod.mode("x", desc="some game")
# Then user.x is the mode name
