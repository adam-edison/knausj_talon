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