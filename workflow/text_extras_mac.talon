os: mac
-

(sender | poster | send it): key(cmd-enter)

code paster:
  user.switcher_focus("code")
  sleep(500ms)
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  edit.paste()

(term | terminal) and:
  insert(" && ")

code hunt all:
  edit.copy()
  sleep(200ms)
  user.switcher_focus("code")
  sleep(500ms)
  user.vscode("workbench.action.findInFiles")
  sleep(200ms)
  edit.paste()

code hunt [(this | that)]:
  edit.copy()
  sleep(200ms)
  user.switcher_focus("code")
  sleep(500ms)
  user.vscode("actions.find")
  sleep(200ms)
  edit.paste()

flick: key(alt-enter)
flicker: 
  key(end)
  sleep(50ms)
  key(alt-enter)

strike: key(shift-enter)

striker:
  key(end)
  sleep(50ms)
  key(shift-enter)

confirm: key(enter)