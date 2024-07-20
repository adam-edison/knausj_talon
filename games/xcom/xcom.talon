win.title: /XCOM/
-

move here:
  mouse_click(1)

(go | take) <number_small>:
  insert("{number_small}")  

(hard | strong) <number_small>:
  insert("{number_small}{number_small}")

do it: key(space)

end turn [early]: 
  key(end)

breach [breach] [breach]:
  user.mouse_click_position_and_return(1929, 1937)
    
parrot(spit): 
  key(2)

parrot(fft):
  mouse_click()

parrot(hawk): 
  key(esc)

parrot(hiss):
  key(shift)

parrot(shush): 
  key(tab)

parrot(smooch):
  key(space)