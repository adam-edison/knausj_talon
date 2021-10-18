tag: user.generic_terminal
-
lysol: user.terminal_list_all_directories()
lisa: user.terminal_list_directories()
katie [<user.text>]: user.terminal_change_directory(text or "")
katie root: user.terminal_change_directory_root()
clear screen: user.terminal_clear_screen()
run last: user.terminal_run_last()
kill all: user.terminal_kill_all()
kill this: user.terminal_kill_this()
directory up: "cd ..\n"
directory home: "cd ~\n"
directory last: "cd -\n"
directory here: "pwd\n"
directory in <user.letter>: 
  insert("cd {letter}")
  key(tab)
rim raff: "rm -rf "
clear view: "clear\n"


set python version old: "ln -s -f /usr/bin/python2.7 /usr/local/bin/python && python --version\n"
set python version new: "ln -s -f /usr/local/bin/python3.9 /usr/local/bin/python && python --version\n"