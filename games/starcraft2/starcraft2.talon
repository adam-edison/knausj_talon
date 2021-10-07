mode: user.gaming
win.title: /StarCraft II/
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

parrot(tut):
    mouse_click(1)

# parrot():
#     key("shift:down")
#     mouse_click(0)
# key("shift:up")

idle:
    key(f1)

add center:
    key(shift-1)

add barracks:
    key(shift-4)

add factory:
    key(shift-5)

add starport:
    key(shift-6)

center [one]:
    key(1:2)

center [two]:
    key(2:2)

orbital:
    key(o)

[planetary] fortress:
    key(p)

liftoff:
    key(l)

barracks:
    key(4:2)

factory:
    key(5:2)

starport:
    key(6:2)

build barracks:
    insert("bb")

build (fusion|core):
    insert("vc")

build factory:
    insert("vf")

build starport:
    insert("vs")

build (engineering| engineering bay | bay):
    insert("be")

build turret:
    insert("bt")

build sensor:
    insert("bn")

build supply:
    insert("bs")

[build] refinery:
    insert("br")

box:
    user.mouse_button_down(0)

cut:
    user.mouse_button_up(0)

scout:
    user.starcraft_scout()

<number> (worker|workers):
    key(1)
    key("s:{number}")

<number> (marines):
    key(4)
    key("a:{number}")

<number> (marauders):
    key(4)
    key("d:{number}")

<number> (tanks):
    key(5)
    key("s:{number}")

siege:
    key(e)

roll:
    key(d)




    

    