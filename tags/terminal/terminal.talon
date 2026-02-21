tag: terminal
-
# tags should be activated for each specific terminal in the respective talon file

lisa [<user.text>]: user.terminal_list_directories(text or "")
lisa: user.terminal_list_all_directories()
katie [dir] [<user.text>]: user.terminal_change_directory(text or "")
katie root: user.terminal_change_directory_root()

katie (up | back): user.terminal_change_directory("..")
katie clip: 
    insert("cd ")
    sleep(50ms)
    edit.paste()
    sleep(50ms)
    key("enter")

katie back: insert("cd -\n")

go <user.system_path>: insert('cd "{system_path}"\n')

path <user.system_path>: insert('"{system_path}"')

clear screen: user.terminal_clear_screen()
run last: user.terminal_run_last()
rerun [<user.text>]: user.terminal_rerun_search(text or "")
rerun search: user.terminal_rerun_search("")
kill all: user.terminal_kill_all()

copy directory: insert("pwd | pbcopy\n")

copy paste:
    edit.copy()
    sleep(50ms)
    edit.paste()
