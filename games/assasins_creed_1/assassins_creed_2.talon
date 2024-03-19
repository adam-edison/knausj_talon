win.title: /^Assassin.*2$/
-

settings():
  key_hold = 16
  key_wait = 32

# uses keyboard only mapping in game
# with numpad * instead of numpad + set in game for high profile

parrot(hiss): 
  key(left:down)
  sleep(500ms)
  key(left:up)

map: key(tab)
menu: key(esc)

weapons: key(q:down)
done: key(q)

context: key(t:down)

center: 
  key(t)
  key(keypad_4)

medicine: key(keypad_1)
blade: key(keypad_0)
sword: key(keypad_3)
fist: key(keypad_2)

target: key(f)

reckless: key(w:down)

# head
(speak | talk | synchronize | head): key(keypad_9)

# eagle vision - held head
(eagle | vision):
  key(keypad_9:down)
  sleep(1500ms)
  key(keypad_9:up)

# weapon hand
(fill | punch | armed): key(keypad_8)

# empty hand
(interact | body | back | hand | decline | drop | grab): key(keypad_6)

# legs
(legs | select): key(keypad_5)

# empty hand - held
loot:
  key(keypad_6:down)
  sleep(6000ms)
  key(keypad_6:up)

# weapon hand
brawl:
  key(keypad_8:8)
  sleep(500ms)
  key(keypad_8:8)
  
sprint: 
  # high profile
  key(keypad_multiply:down)
  # legs
  key(keypad_5:down)

fast [walk]:
  key(keypad_5:down)

walk:
  key(keypad_multiply)
  key(keypad_5)

accept: key(keypad_5:2)

item <number_small>:
  count = number_small - 1
  key("down:{count}")
  key(enter)

database:
  key(esc)
  sleep(2000ms)
  key(down:6)
  key(enter)