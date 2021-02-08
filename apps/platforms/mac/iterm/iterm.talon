os: mac
app: iterm2
-
tag(): terminal
# todo: filemanager support
#tag(): user.file_manager
tag(): user.generic_terminal 
tag(): user.git
tag(): user.kubectl
tag(): user.tabs

resolve conflicts:
  user.switcher_focus("intellij")
  sleep(700ms)
  key(cmd-shift-i)
  sleep(500ms)
  key(c)

find failing:
  key(cmd-f)
  sleep(200ms)
  insert("failing")
  sleep(100ms)
  key(enter)

find messy error:
  key(cmd-f)
  sleep(200ms)
  insert("\"level\":\"error\"")
  sleep(100ms)
  key(enter)