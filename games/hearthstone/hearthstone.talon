win.title: /Hearthstone/
os: windows
-

power: 
  mouse_move(2294, 1622)
  mouse_click()

clearing: mouse_move(2921, 1620)

play button: user.mouse_click_position_and_return(2839, 1674)

confirm button: user.mouse_click_position_and_return(1922, 1688)

ending: 
  user.mouse_click_position_and_return(3098, 982)
  mouse_move(2921, 1620)

hero: user.mouse_drag_to_position_and_return(1872, 405)

summon: user.mouse_drag_to_position_and_return(928, 1209)

well played:
  mouse_move(1924, 1602)
  sleep(50ms)
  mouse_click(1)
  sleep(300ms)
  mouse_move(1557, 1551)
  sleep(50ms)
  mouse_click()
  sleep(100ms)

say thanks:
  mouse_move(1924, 1602)
  sleep(50ms)
  mouse_click(1)
  sleep(300ms)
  mouse_move(1684, 1376)
  sleep(50ms)
  mouse_click()
  sleep(100ms)

say mistake:
  mouse_move(1924, 1602)
  sleep(50ms)
  mouse_click(1)
  sleep(300ms)
  mouse_move(2338, 1568)
  sleep(50ms)
  mouse_click()
  sleep(100ms)


parrot(smooch):
  mouse_click()

parrot(fft):
  mouse_click()