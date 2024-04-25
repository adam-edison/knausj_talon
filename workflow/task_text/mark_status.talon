mark {user.task_status}: user.mark_status(user.task_status)
mark clear: user.mark_clear_status()
mark last {user.task_status}: 
  key(up)
  user.mark_status(user.task_status)
mark next {user.task_status}: 
  key(down)
  user.mark_status(user.task_status)