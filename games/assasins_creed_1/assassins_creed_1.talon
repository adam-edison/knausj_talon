win.title: /^Assassin.*Creed$/
-

reckless: key(w:down)

sprint: 
  user.mouse_drag(1)
  key(space:down)

walk: 
  user.mouse_drag_end()
  key(space:up)
  key(w:up)

blend: key(space:down)

wrist blade: key(2)
sword: key(3)

parry: 
  user.mouse_drag_end()
  sleep(50ms)
  user.mouse_drag(1)

hit: 
  user.mouse_drag(0)
  sleep(50ms)
  user.mouse_drag_end()
  sleep(500ms)

swing:
  user.mouse_drag_end()
  user.mouse_drag(0)
  sleep(2000ms)
  user.mouse_drag_end()
  sleep(50ms)
  user.mouse_drag(1)

grab:
  user.mouse_drag_end()
  sleep(50ms)
  key(shift:down)
  sleep(200ms)
  key(shift:up)
  sleep(50ms)
  user.mouse_drag(1)

break:
  sleep(50ms)
  key(shift:down)
  sleep(200ms)
  key(shift:up)

parrot(shk):
  user.mouse_drag(0)
  sleep(50ms)
  user.mouse_drag_end()

parrot(smooch): 
  key(shift:down)
  sleep(20ms)
  key(shift:up)