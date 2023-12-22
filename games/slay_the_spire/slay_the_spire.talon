win.title: /Slay the Spire/
-
# <phrase>: skip()

parrot(hiss): mouse_drag(0)
parrot(shush): user.mouse_drag_end(0)

parrot(smooch): key(e)
parrot(fft): mouse_click()

# numbers for navigation using mod
parrot(pop): key(1)
# parrot(smooch): key(2)
# parrot(spit): key(3)
# parrot(pop): key(4)

map up: 
  user.mouse_scroll_up_continuous()
  sleep(350ms)
  user.mouse_scroll_stop()

map down: 
  user.mouse_scroll_down_continuous()
  sleep(350ms)
  user.mouse_scroll_stop()

(play | hit) <number_small>:
  insert("{number_small}")
  sleep(100ms)
  mouse_click()
  sleep(300ms)

target:
  tracking.control_toggle()
  sleep(1500ms)
  user.mouse_sleep()

last: key(e)

take all <number_small>:
  user.wait_and_press("200ms", "1")
  repeat(number_small - 1)


# just use numbers. e.g. 4 2

# (play | hit) <number_small> <number_small>:
#   insert(number_small_1)
#   sleep(300ms)
#   insert(number_small_2)
#   sleep(300ms)

# use screen-spots for 
# card 1-3
# card 1-4 of 4
# choice 1-3 (for menus)