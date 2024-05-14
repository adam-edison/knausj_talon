os: mac
win.title: /Google Calendar/
-

event {user.task_status}:
  user.mark_status(user.task_status)
  sleep(50ms)
  key(cmd-enter)
  sleep(400ms)
  key(enter)