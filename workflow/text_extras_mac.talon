os: mac
-

(sender | poster | send it): key(cmd-enter)

code paster:
  user.switcher_focus("code")
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  user.indexed_clipboard_paste(clipboard_index)