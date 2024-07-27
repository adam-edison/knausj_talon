app: chrome
-

settings():
  # Necessary to stop commands like 'slap' getting jumbled
  key_wait = 9.0

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