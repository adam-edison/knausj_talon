mode: user.gaming
win.title: /Age of Empires/
-
settings():
    key_wait = 0.4

<user.letter>: key(letter)
<user.symbol_key>: key(symbol_key)
<user.function_key>: key(function_key)
<user.special_key>: key(special_key)
<user.modifiers> <user.unmodified_key>: key("{modifiers}-{unmodified_key}")
<user.number_string>: "{number_string}"
<user.ordinals>: core.repeat_command(ordinals-1)

curse yes: user.mouse_show_cursor()
curse no: user.mouse_hide_cursor()

parrot(tut):
    mouse_click(1)

parrot(cluck):
    mouse_click(1)

parrot(hiss):
    key(shift:down)

parrot(hiss:repeat):
    sleep(100ms)
    mouse_click(1)

parrot(hiss:stop):
    key(shift:up)



    

    