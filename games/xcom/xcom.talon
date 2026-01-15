win.title: /XCOM/
-

move here:
  mouse_click(1)

(go | take) <number_small>:
  insert("{number_small}")  

(hard | strong) <number_small>:
  insert("{number_small}{number_small}")

do it: key(space)

jiggle:
  user.mouse_move_relative(0, 10)
  user.mouse_move_relative(0, -10)
  user.mouse_move_relative(10, 0)
  user.mouse_move_relative(0, 10)


ending: 
  key(end)

breach [breach] [breach]:
  mouse_move(1929, 1870)
  user.mouse_click_position_and_return(1929, 1900)
  mouse_move(1929, 1870)
  user.mouse_click_position_and_return(1929, 1900)
    
parrot(spit): 
  key(2)

parrot(fft):
  mouse_click()

parrot(hawk): 
  key(esc)

parrot(sss):
  key(shift)

parrot(shh): 
  key(tab)

parrot(kiss):
  key(space)