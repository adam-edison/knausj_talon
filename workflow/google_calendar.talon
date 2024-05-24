os: mac
win.title: /Google Calendar/
-

edit {user.task_status}:
  key(tab)
  sleep(50ms)
  key(enter)
  sleep(2000ms)
  key(tab)
  sleep(200ms)
  user.mark_status(user.task_status)
  sleep(100ms)
  key(cmd-enter)
  sleep(600ms)
  key(enter)

event {user.task_status}:
  key(tab)
  sleep(50ms)
  user.mark_status(user.task_status)
  sleep(50ms)
  key(cmd-enter)
  sleep(600ms)
  key(enter)