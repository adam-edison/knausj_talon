os: mac
-

(sender | poster | send it): key(cmd-enter)

code paster:
  user.switcher_focus("code")
  sleep(500ms)
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  edit.paste()

code hunt all:
  edit.copy()
  sleep(200ms)
  user.switcher_focus("code")
  sleep(500ms)
  user.vscode("workbench.action.findInFiles")
  sleep(200ms)
  edit.paste()

confirm: key(enter)