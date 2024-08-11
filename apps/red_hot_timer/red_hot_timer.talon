os: mac
-

# This is a globally available workflow

timer show: key(ctrl-cmd-shift-alt-t)

timer new <number> <word>:
  key(ctrl-cmd-shift-alt-t)
  sleep(1000ms)
  edit.select_all()
  insert("{number}m {word}")