win.title: /Potionomics/
os: windows
-

get <number_small>:
  times = number_small - 1
  mouse_click(0)
  repeat(times)

place <number_small>:
  user.double_click(number_small, 100)

targeting:
  tracking.control_toggle()
  sleep(1500ms)
  user.mouse_sleep()

# play a card
parrot(smooch): key(q)

parrot(fft): 
  mouse_click()

parrot(hiss):
  mouse_click()
  sleep(50ms)
  mouse_click()

slot one: 
  mouse_move(2603, 731)
  sleep(100ms)
  mouse_click()

start day: 
  mouse_move(1938, 1847)
  sleep(100ms)
  mouse_click()

open shop:
  mouse_move(238, 500)
  sleep(100ms)
  mouse_click()

brew:
  mouse_move(241, 770)
  sleep(100ms)
  mouse_click()

arrange potions:
  mouse_move(327, 625)
  sleep(100ms)
  mouse_click()

deck builder:
  mouse_move(371, 888)
  sleep(100ms)
  mouse_click()

travel:
  mouse_move(269, 1036)
  sleep(100ms)
  mouse_click()

gardening:
  mouse_move(375, 1161)
  sleep(100ms)
  mouse_click()

customization:
  mouse_move(307, 1439)
  sleep(100ms)
  mouse_click()

basement:
  mouse_move(342, 1972)
  sleep(100ms)
  mouse_click()

(bottle | age | discard | brew <number_small> | embark | collect):
  mouse_move(1936, 2010)
  sleep(100ms)
  mouse_click()

accept bottle:
  mouse_move(1928, 1645)
  sleep(100ms)
  mouse_click()

accept loot:
  mouse_move(1707, 1693)
  sleep(100ms)
  mouse_click()

returning:
  mouse_move(278, 2021)
  sleep(100ms)
  mouse_click()

end the day:
  mouse_move(296, 1673)
  sleep(100ms)
  mouse_click()

equipment:
  mouse_move(764, 694)
  sleep(100ms)
  mouse_click()

# these trigger ahk scripts



expand: key(x)
(end turn | ending): key(e)
