win.title: /MinionMasters/
-

settings():
  key_wait = 20.0

one:
  key(q)
  mouse_click()

two:
  key(w)
  mouse_click()

three:
  key(e)
  mouse_click()

four:
  key(r)
  mouse_click()

<number_small> skeletons:
  key(number_small)
  sleep(1000ms)
  key(q)
  mouse_click()

<number_small> health:
  key(number_small)
  sleep(1000ms)
  key(e)
  mouse_click()