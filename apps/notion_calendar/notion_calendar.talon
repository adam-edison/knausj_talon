win.title: /Notion Calendar/
-

event {user.task_status}:
    insert("et")
    user.mark_status(user.task_status)
    sleep(100ms)
    key(enter)
    sleep(200ms)
    key(enter)
