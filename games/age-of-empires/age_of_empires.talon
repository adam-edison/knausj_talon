mode: user.gaming
win.title: /Age of Empires/
-
settings():
    key_wait = 0.4


set <user.number_key>: key("ctrl-{number_key}"
<user.number_key>: key(number_key)
<user.letter>: key(letter)

curse yes: user.mouse_show_cursor()
curse no: user.mouse_hide_cursor()

parrot(tut):
    mouse_click(1)

parrot(cluck):
    mouse_click(1)

<phrase>: skip()

parrot(hiss):
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



    

    