app: vscode
-

auto fix: key(alt-enter)

rerun:
  user.vscode_terminal(1)
  key(up enter)
  user.vscode("workbench.action.toggleMaximizedPanel")

run test:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("npm run test\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

run test unit:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("npm run test:unit\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

run test integration:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("npm run test:integration\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

run test unit update:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("npm run test:unit -- -u\n")
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

open folder:
  user.vscode("workbench.action.files.openFolder")

# mac os version
terminal here:
  key(ctrl-shift-`)

terminal status:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git status\n")

terminal bottom:
  user.vscode("workbench.action.terminal.scrollToBottom")

rebase against develop:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git checkout develop && git pull && git checkout - && git rebase develop\n")

git graph:
  user.vscode("git-graph.view")

terminal clip <user.word>:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  user.indexed_clipboard_paste(clipboard_index)

terminal paster:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  edit.paste()

new folder <user.word>:
  user.vscode("explorer.newFolder")
  insert("{user.word}")

new file <user.word>:
  user.vscode("explorer.newFile")
  insert("{user.word}")

checkout dot:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git checkout .\n")

terminal clear:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("clear\n")
