app: chrome
-

make expand <user.text>:
  insert("/")
  sleep(500ms)
  insert("expand")
  sleep(100ms)
  key(enter)
  sleep(100ms)
  key(up)
  sleep(100ms)
  insert(user.text)