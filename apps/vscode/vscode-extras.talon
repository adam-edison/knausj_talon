app: vscode
-

rerun:
  user.vscode_terminal(1)
  key(up enter)
  user.vscode("workbench.action.toggleMaximizedPanel")

run test:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("npm run test\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

update snapshots:
  insert("npm run test -- -u\n")

coding:
  user.vscode("workbench.action.focusActiveEditorGroup")
  user.vscode("workbench.action.focusActiveEditorGroup")

terminal git push:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("git push\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

git status:
  user.vscode("workbench.scm.focus")
# refresh the git view, requires keybinding to be defined for "git refresh"
  key(ctrl-shift-alt-f5)

view to do:
  user.vscode("workbench.action.quickOpen")
  sleep(50ms)
  insert("view todo")
  sleep(100ms)
  key(enter)

log below:
  edit.copy()
  edit.line_end()
  key(enter)
  user.paste("console.log({{ ")
  edit.paste()
  user.paste(" }});")