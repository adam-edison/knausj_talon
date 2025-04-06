app: vscode
app: cursor
-

safe saver:
  user.vscode("workbench.action.files.saveWithoutFormatting")

auto fix: key(alt-enter)

comment line: key(cmd-/)

follower: 
  key(cmd:down)
  mouse_click()
  key(cmd:up)

completer:
  key(tab)
  sleep(200ms)
  key(tab)

slide left:
  user.vscode("workbench.action.moveEditorLeftInGroup")

slide right:
  user.vscode("workbench.action.moveEditorRightInGroup")

terminal max:
  user.vscode("workbench.action.toggleMaximizedPanel")

toggle selection:
  user.vscode("toggleFindInSelection")

toggle regex:
  user.vscode("toggleFindRegex")

hunt failure:
  user.vscode_terminal(1)
  sleep(100ms)
  user.find("")
  sleep(200ms)
  insert("FAIL")

[copy] permalink: user.vscode("copy-github-permalink.copy")

^hunt again$: key(shift-cmd-r)

paste clean object: user.clean_jest_object_paste()

filter test selection:
  edit.copy()
  sleep(200ms)
  user.vscode_terminal(1)
  sleep(100ms)
  insert(" -- -t ''")
  sleep(800ms)
  key(left)
  sleep(300ms)
  edit.paste()
  key(enter)

^package install$:
  user.vscode_terminal(1)
  sleep(300ms)
  insert("npm install")


^package <user.word>$:
  user.vscode_terminal(1)
  sleep(300ms)
  insert("npm run {user.word}")

^package <user.word> <user.word>$:
  user.vscode_terminal(1)
  sleep(100ms)
  insert("npm run {user.word_1}:{user.word_2}")

^package <user.word> <user.word> <user.word>$:
  user.vscode_terminal(1)
  sleep(100ms)
  insert("npm run {user.word_1}:{user.word_2}:{user.word_3}")

perform {user.pnpm_filters} <user.word>:
  user.pnpm_run_with_filter(user.pnpm_filters, user.word)

perform <user.word>:
  user.vscode_terminal(1)
  sleep(300ms)
  insert("pnpm run {user.word}")

perform <user.word> <user.word>:
  user.vscode_terminal(1)
  sleep(100ms)
  insert("pnpm run {user.word_1}:{user.word_2}")

perform <user.word> <user.word> <user.word>:
  user.vscode_terminal(1)
  sleep(100ms)
  insert("pnpm run {user.word_1}:{user.word_2}:{user.word_3}")

window <user.word>:
  user.vscode("workbench.action.switchWindow")
  sleep(100ms)
  insert("{user.word}\n")

clean run:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("clear\n")
  sleep(1000ms)
  key(up up enter)

(rerun | run last):
  user.vscode_terminal(1)
  key(up enter)

run lint:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("npm run lint\n")

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

terminal push:
  user.vscode_terminal(1)
  sleep(500ms)
  insert("git push\n")
  user.vscode("workbench.action.toggleMaximizedPanel")

git status:
  user.vscode("workbench.scm.focus")
# refresh the git view, requires keybinding to be defined for "git refresh"
  key(ctrl-shift-alt-f5)

git publish:
  user.vscode("git.publish")

next change:
  key(down space)

first change:
  key(tab:2)
  key(down:2)
  key(space)

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

terminal top:
  user.vscode("workbench.action.terminal.scrollToTop")

fetch develop:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git checkout develop && git fetch -p && git pull\n")

rebase against develop:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git checkout develop && git pull && git checkout - && git rebase develop\n")

git graph:
  user.vscode("git-graph.view")

terminal paster <user.word>:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  user.indexed_clipboard_paste(clipboard_index)

terminal paster:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  edit.paste()

new folder [<user.word>]:
  title = user.word or ""
  user.vscode("explorer.newFolder")
  insert("{title}")

new file [<user.word>]:
  title = user.word or ""
  user.vscode("explorer.newFile")
  insert("{title}")

git checkout dot:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git checkout .\n")

git push:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git push\n")

git push force:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("git push --force-with-lease\n")

show to doos:
  user.vscode("todo-tree-view.focus")

terminal clear:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("clear\n")

^(expand | grow | shrink | contract):
  user.vscode("workbench.action.toggleMaximizedPanel")

uninstall clip:
  user.vscode("workbench.action.terminal.focus")
  sleep(200ms)
  insert("npm uninstall ")
  sleep(200ms)
  edit.paste()

git changes:
  user.vscode("git.viewChanges")

# Extensions
git generate: key(ctrl-shift-alt-m)