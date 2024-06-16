win.title: /Hearthstone/
-

play button:
  mouse_move(2839, 1674)
  sleep(50ms)
  mouse_click()

ending:
  mouse_move(3098, 982)
  sleep(50ms)
  mouse_click()

hero: user.mouse_drag_to_position_and_return(1872, 405)

my side: user.mouse_drag_to_position_and_return(928, 1209)

well played:
  mouse_move(1924, 1602)
  sleep(50ms)
  mouse_click(1)
  sleep(300ms)
  mouse_move(1557, 1551)
  sleep(50ms)
  mouse_click()
  sleep(100ms)


parrot(smooch):
  mouse_click()

parrot(fft):
  mouse_click()