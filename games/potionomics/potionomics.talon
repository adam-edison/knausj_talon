win.title: /Potionomics/
-

get <number_small>:
  times = number_small - 1
  mouse_click(0)
  repeat(times)

place <number_small>:
  user.double_click(number_small, 100)

parrot(smooch): 
  mouse_click(0)
  sleep(50ms)
  mouse_click(0)

parrot(fft): 
  user.mouse_drag_end()
  mouse_click(0)

parrot(hiss):
  user.mouse_drag(0)
  sleep(300ms)
  user.mouse_move_relative(0,-700)
  sleep(300ms)
  user.mouse_drag_end()
  sleep(50ms)
  user.mouse_move_relative(0,700)

parrot(shush):
  user.mouse_drag(0)
  