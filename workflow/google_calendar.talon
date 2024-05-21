os: mac
win.title: /Google Calendar/
-

edit {user.task_status}:
  key(tab)
  sleep(50ms)
  key(enter)
  sleep(1000ms)
  key(tab)
  sleep(100ms)
  user.mark_status(user.task_status)
  sleep(100ms)
  key(cmd-enter)

event {user.task_status}:
  key(tab)
  sleep(50ms)
  user.mark_status(user.task_status)
  sleep(50ms)
  key(cmd-enter)
  sleep(400ms)
  key(enter)