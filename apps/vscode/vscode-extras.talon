app: vscode
-

rerun:
  user.vscode_terminal(1)
  key(up enter)
  user.vscode("workbench.action.toggleMaximizedPanel")

run test:
  user.vscode_terminal(1)
  insert("npm run test\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

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

log below:
  edit.copy()
  edit.line_end()
  key(enter)
  user.paste("console.log({{ ")
  edit.paste()
  user.paste(" }});")