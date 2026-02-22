tag: terminal
-
# Repo path commands
list repos: insert('ls -al ~/repositories\n')

hunt repo <user.text>: 
    insert('cd ~/repositories\n')
    sleep(200ms)
    insert('cd {text}')
    sleep(100ms)
    key(tab:3)

open [repo] <user.repo_paths>: insert('cd "{repo_paths}"\n')
cursor <user.repo_paths>: insert('cursor "{repo_paths}"\n')
cursor dot: insert('cursor .\n')

launch (clock | claude): insert('claude\n')

claude [restart] resume:
    key(ctrl-c)
    sleep(100ms)
    key(ctrl-c)
    sleep(2000ms)
    insert('clear\n')
    sleep(1000ms)
    insert('claude --resume\n')
    sleep(2000ms)
    key(enter)

claude restart:
    key(ctrl-c)
    sleep(200ms)
    insert('/quit\n')
    sleep(1000ms)
    insert('clear\n')
    sleep(1000ms)
    insert('claude\n')
