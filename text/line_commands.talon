tag: user.line_commands
-
#this defines some common line commands. More may be defined that are ide-specific.
(dusk|fall) <number>: 
    edit.jump_line(number)
    edit.line_end()

after <number>: 
    edit.jump_line(number)
    edit.line_end()
    key(enter)

(dawn|rise) <number>: 
    edit.jump_line(number)
    edit.line_start()

comment <number>:
    user.select_range(number, number)
    code.toggle_comment()
    
comment <number> until <number>: 
    user.select_range(number_1, number_2)
    code.toggle_comment()

handle:
    edit.line_end()
    insert(";")

paddle:
    edit.line_end()
    insert(";\n")

splash:
    edit.line_end()
    insert(",\n")

clear this line:
    edit.select_line()
    key(backspace)

clear <number>:
    edit.jump_line(number)
    edit.select_line()
    key(backspace:2)

# TODO: AGE clear <number> until <number>:

# ONLY CONSIDER BELOW TODO after trying draft window
# TODO: AGE before <symbol or letter> <nth occurence> - maybe use experimental correction interface instead (textarea, draft window)
# TODO: AGE after <symbol or letter> <nth occurence> - maybe use experimental correction interface instead (textarea, draft window)
# TODO: AGE <clear/select/delete/copy/cut/search/hunt> between <symbol_name> <nth occurence>
# TODO: AGE: <copy/cut> <number> until <number> in <number> - to insert a block somewhere


blank <number>:
    edit.jump_line(number)
    edit.select_line()
    key(backspace)

clear range <number> until <number>: 
    user.select_range(number_1, number_2)
    edit.delete()

copy <number>: 
    user.select_range(number, number)
    edit.copy()

copy <number> until <number>: 
    user.select_range(number_1, number_2)
    edit.copy()

cut <number>: 
    user.select_range(number, number)
    edit.cut()

cut <number> until <number>: 
    user.select_range(number_1, number_2)
    edit.cut()

(paste | replace) <number> until <number>:
    user.select_range(number_1, number_2)
    edit.paste()

paste after <number>:
    edit.jump_line(number)
    edit.line_end()
    key(enter)
    edit.paste()

replace <number> until <number>: 
    user.select_range(number_1, number_2)
    edit.paste()

replace <number>:
    edit.jump_line(number)
    edit.select_line()
    edit.paste()
    
(select | cell | sell) <number>: user.select_range(number, number)
(select | cell | sell) <number> until <number>: user.select_range(number_1, number_2)
tab that: edit.indent_more()
line <number> tab:
    edit.jump_line(number)
    edit.indent_more()
tab <number> until <number>:
    user.select_range(number_1, number_2)
    edit.indent_more()
retab that: edit.indent_less()
retab [line] <number>:
    user.select_range(number, number)
    edit.indent_less()
retab <number> until <number>:
    user.select_range(number_1, number_2)
    edit.indent_less()
drag [line] down: edit.line_swap_down()
drag [line] up: edit.line_swap_up()
drag up [line] <number>:
    user.select_range(number, number)
    edit.line_swap_up()
drag up <number> until <number>: 
    user.select_range(number_1, number_2)
    edit.line_swap_up()
drag down [line] <number>: 
    user.select_range(number, number)
    edit.line_swap_down()
drag down <number> until <number>: 
    user.select_range(number_1, number_2)
    edit.line_swap_down()

# TODO: AGE associate these commands with azure data studio
clone line: edit.line_clone()

slide right:
    key(home)
    sleep(100ms)
    key(space:2)
    key(end)

insert line:
    key(home)
    sleep(20ms)
    key(enter)
    sleep(20ms)
    key(up)

ladder:
    key(home)
    sleep(20ms)
    key(enter)
    sleep(20ms)
    key(up)