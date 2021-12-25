mode: user.gaming
win.title: /Age of Empires/
-
tag(): user.full_mouse_grid_enabled

settings():
    key_wait = 0.4

<user.letter>: key(letter)
# <user.symbol_key>: key(symbol_key)
# <user.function_key>: key(function_key)
# <user.special_key>: key(special_key)
# <user.modifiers> <user.unmodified_key>: key("{modifiers}-{unmodified_key}")
<user.number_string>: "{number_string}"
<user.number> times: core.repeat_command(number-1)

curse yes: user.mouse_show_cursor()
curse no: user.mouse_hide_cursor()

parrot(tut):
    mouse_click(1)

parrot(cluck):
    mouse_click(1)

<phrase>: skip()

attack:
    key(a)
    sleep(100ms)
    mouse_click(0)

# (respond|on it|adam out):
#     # toggle discord mute
#     key(ctrl-shift-m)

# parrot(hiss):
#     key(shift:down)

# parrot(hiss:repeat):
#     sleep(500ms)
#     mouse_click(1)

# parrot(hiss:stop):
#     key(shift:up)



    

    