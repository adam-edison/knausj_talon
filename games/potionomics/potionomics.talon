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

(bottle | age | discard | brew <number_small> | brew it | brewing| embark | collect):
  mouse_move(1936, 2010)
  sleep(100ms)
  mouse_click()

accept (bottle | collect):
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


close deal:
  mouse_move(3532, 1275)
  sleep(100ms)
  mouse_click()

reset filters:
  mouse_move(930, 906)
  sleep(100ms)
  mouse_click()

recipe:
  mouse_move(2026, 69)
  sleep(100ms)
  mouse_click()

calendar:
  mouse_move(3182, 671)
  sleep(100ms)
  mouse_click()

brew sort pill:
  mouse_move(848, 912)
  sleep(100ms)
  mouse_click()

brew clear:
  mouse_move(915, 900)
  sleep(100ms)
  mouse_click()

reject:
  mouse_move(2224, 1635)
  sleep(100ms)
  mouse_click()

(buy | by | take) <number_small>:
  mouse_click()
  sleep(100ms)
  mouse_move(2300, 1000)
  sleep(100ms)
  mouse_move(2302, 1018)
  sleep(200ms)
  times = number_small - 1
  user.single_click(times, 100)
  sleep(100ms)
  mouse_move(1754, 1396)
  sleep(100ms)
  mouse_click()

next: key(keypad_6)
last: key(keypad_4)

(end turn | ending):
  mouse_move(3400, 1150)
  sleep(100ms)
  mouse_click()
  sleep(100ms)
  mouse_move(2000, 1850)


# these trigger ahk scripts


jiggle: key(j)
expand: key(x)

