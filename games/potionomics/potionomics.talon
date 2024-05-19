win.title: /Potionomics/
-

parrot(smooch): 
  mouse_click(0)
  sleep(50ms)
  mouse_click(0)

parrot(fft): mouse_click(0)

parrot(shush:stop):
  user.mouse_drag(0)
  sleep(300ms)
  user.mouse_move_relative(0,-700)
  sleep(300ms)
  user.mouse_drag_end()