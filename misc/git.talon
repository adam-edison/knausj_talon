tag: terminal
-
# Standard commands
[git] add patch: "git add . -p\n"
[git] add blank: "git add "
[git] add all: "git add -A\n"
# TODO: AGE fix this, it doesn't work - 5 mod adds 5 files
# [git] add <number> mod:
#     command = "git add `git status | grep modified | awk '{{print $2}}' | head -n {number}` && git status\n"
#     insert(command)
[git] add java files: "git add :/*.java\n"
[git] add javascript files: "git add :/*.js\n"
[git] bisect: "git bisect "
[git] blame: "git blame "
[git] branch local: "git branch\n"
[git] branch remote: "git branch --remote\n"

# we would not want to do this by mistake ever
[git] checkout dot: "git checkout ." 
[git] checkout develop: "git checkout develop && git fetch -p && git pull\n"
[git] checkout clip:
    insert("git checkout ")
    edit.paste()
    key(enter)
[git] checkout master: "git checkout master\n"
# it would be better to prompt for this number - hard to get it all in with voice and guarantee correctness
[git] checkout <number>:
    insert("git fetch -p && git checkout `git branch -r | grep 'DEV.*\-{number}\-' | sed -E 's/(.*)\/(.*)/\\2/'`\n")
# TODO: AGE fix this, it doesn't work - 5 mod checks out 5 files
# [git] checkout <number> mod:
#     command = "git checkout `git status | grep modified | awk '{{print $2}}' | head -n {number}`"
#     # require hitting enter to confirm this - it is not reversible, so not safe if mis-recognized
#     insert(command)

[git] branch delete <number>:
    insert("git branch -D $(git branch | grep {number})")
# [git] branch delete <number> mark <number>:
#     insert("git branch -D $(git branch | grep {number_1}{number_2})")
[git] cherry pick: "git cherry-pick "
[git] clean dry run: "git clean -d -n\n"

# left off \n to ensure this command is not recognized by accident to disastrous effects
[git] clean force: "git clean -d -f"

[git] clone: "git clone "

[git] commit message:
    insert("git branch | grep '*' | awk '{{print $2}}' | cut -d '-' -f 1-2 | tr -d '\\n' | pbcopy")
    key(enter)
    insert("git commit -m \"")
    sleep(500ms)
    key(cmd-v)
    insert(": \"")
    key(left)

[git] commit all:
    user.paste("git add -A\n")
    insert("git branch | grep '*' | awk '{{print $2}}' | cut -d '-' -f 1-2 | tr -d '\\n' | pbcopy")
    key(enter)
    sleep(500ms)
    insert("git commit -m \"")
    key(cmd-v)
    insert(": \"")
    key(left)

[git] squash to initial:
    user.paste("[git] rebase --interactive :/initial\n")

[git] squash to merged:
    user.paste("[git] rebase --interactive :/Merged\n")

[git] commit edit: "git commit\n"
[git] commit amend: "git commit --amend\n"
[git] diff (colour|color) words: "git diff --color-words "
[git] diff all: "git diff\n"
[git] diff cached: "git diff --cached\n"
[git] show commit: "git show --color --pretty=format:%b "
[git] fetch: "git fetch -p\n"
[git] log all: "git log\n"
[git] log all changes: "git log -c\n"
[git] log: "git log --oneline\n"
[git] log changes: "git log -c "
# [git] merge: "git merge "
# [git] move: "git mv "
[git] checkout new branch: "git checkout -b "
[git] checkout last: "git checkout -\n"
[git] pull: "git pull\n"
[git] pull origin: "git pull origin "
[git] pull rebase: "git pull --rebase\n"
[git] pull fast forward: "git pull --ff-only\n"
[git] pull develop: "git checkout develop && git fetch -p && git pull"
[git] push: "git push \n"
[git] push upstream: "git push -u\n"
[git] push force: "git push --force-with-lease\n"
[git] push brute force: "git push -f\n"
[git] push origin: "git push origin "
[git] push up stream origin: "git push -u origin"
[git] push tags: "git push --tags\n"
[git] push all: "git push -u\n"
[git] rebase: "git rebase\n"
[git] rebase clip: 
    insert("git rebase -i ")
    key(cmd-v)
    key(enter)
[git] rebase continue: "git rebase --continue\n"
[git] rebase skip: "git rebase --skip"
[git] rebase abort: "git rebase --abort"
[git] rebase interactive <number>:
    insert("git rebase -i HEAD~{number}\n")

[git] remove: "git rm "
[git] (remove|delete) branch: "git branch -d "
[git] (remove|delete) remote branch: "git push --delete origin "
[git] reset: "git reset "
[git] reset soft: "git reset --soft "
[git] reset hard: "git reset --hard "
[git] restore: "git restore "
[git] restore staged: "git restore --staged "
[git] restore all staged: "git restore --staged ."
[git] remote show origin: "git remote show origin\n"
[git] remote add upstream: "git remote add upstream "
[git] show: "git show "
[git] stash pop: "git stash pop\n"
[git] stash save: 
    insert("git stash save -u -m ''")
    key(left)
[git] stash save <user.text>: 
    insert("git stash save -u -m '{text}'")
    key(left)

[git] stash show patch: "git stash show -p\n"

stash temporary:
    insert("git stash save -u -m 'temporary'")

[git] stash apply <number>: 
    insert("git stash apply stash@{")
    insert("{number}")
    insert("}\n")
[git] stash drop <number>: 
    insert("git stash drop stash@{")
    insert("{number}")
    insert("}")
[git] stash list: "git stash list\n"
[git] stash show: "git stash show"
(status|report): "git status\n"
[git] submodule add:  "git submodule add "
[git] tag: "git tag "

# Convenience
[git] edit config: "git config --local -e\n"

[git] checkout highlighted:
    edit.copy()
    insert("git checkout ")
    edit.paste()
    key(enter)

[git] clone clipboard:
  insert("git clone ")
  edit.paste()
  key(enter)
[git] diff highlighted:
    edit.copy()
    insert("git diff ")
    edit.paste()
    key(enter)
[git] diff clipboard:
    insert("git diff ")
    edit.paste()
    key(enter)
[git] add highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    key(enter)
    insert("clear && git status\n")
[git] restore highlighted:
    edit.copy()
    insert("git restore --staged ")
    edit.paste()
    key(enter)
    insert("clear && git status\n")
[git] add clipboard:
    insert("git add ")
    edit.paste()
    key(enter)
[git] commit highlighted:
    edit.copy()
    insert("git add ")
    edit.paste()
    insert("\ngit commit\n")

# only do this when sure commit message it good and can be pushed
[git] push status:
    edit.line_end()
    key(enter)
    sleep(500ms)
    insert("git push -u && git status\n")

clear status:
    insert("clear && git status\n")

# dry run to see what will be deleted
[git] branch cleanup: "git fetch --all -p; git branch -vv | grep ': gone]' | awk '{{ print $1 }}'\n"

# delete ALL local branches that do not exist in the remote
confirm [git] branch cleanup: "git fetch --all -p; git branch -vv | grep ': gone]' | awk '{{ print $1 }}' | xargs -n 1 git branch -D\n"

[git] reset soft head: "git reset --soft HEAD^\n"