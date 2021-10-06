finder:
    edit.find()

next one:
    edit.find_next()

(go word left|whirl):
    edit.word_left()

(go word right|wire):
    edit.word_right()

(go left|last):
    edit.left()

(go right|next):
    sleep(10ms)
    edit.right()

(go up|jump):
    edit.up()

(go down|duck):
    edit.down()

go line start:
    edit.line_start()

go line end:
    edit.line_end()

go way left:
    edit.line_start()
    edit.line_start()

go way right:
    edit.line_end()

go way down:
    edit.file_end()

go way up:
    edit.file_start()
    
go bottom:
    edit.file_end()
    
go top:
    edit.file_start()

go page down:
    edit.page_down()

go page up:
    edit.page_up()

# selecting
select line:
    edit.line_start()
    edit.extend_line_end()

select all:
    edit.select_all()


select left:
    edit.extend_left()

select right:
    edit.extend_right()

select up:
    edit.extend_line_up()

select down:
    edit.extend_line_down()

select word left:
    edit.extend_word_left()

select word right:
    edit.extend_word_right()

select way left:
    edit.extend_line_start()

select way right:
    edit.extend_line_end()

select way up:
    edit.extend_file_start()

select way down:
    edit.extend_file_end()

# editing
indent [more]:
    edit.indent_more()

(indent less | out dent):
    edit.indent_less()

# deleting
clear line:
    edit.delete_line()

clear after:
    key(shift-end)
    sleep(20ms)
    key(delete)

clear before:
    key(shift-home)
    sleep(20ms)
    key(delete)

clear up:
    edit.extend_line_up()
    edit.delete()

clear down:
    edit.extend_line_down()
    edit.delete()

clear word left:
    edit.extend_word_left()
    edit.delete()

clear word right:
    edit.extend_word_right()
    edit.delete()

clear way left:
    edit.extend_line_start()
    edit.delete()

clear way right:
    edit.extend_line_end()
    edit.delete()

clear way up:
    edit.extend_file_start()
    edit.delete()

clear way down:
    edit.extend_file_end()
    edit.delete()

clear all:
    edit.select_all()
    edit.delete()

#copy commands
copy all: 
    edit.select_all()
    edit.copy()

copy line:
    edit.line_start()
    edit.extend_line_end()
    edit.copy()
#to do: do we want these variants, seem to conflict
# copy left: 
#      edit.extend_left()
#      edit.copy()
# copy right: 
#     edit.extend_right()
#     edit.copy()
# copy up: 
#     edit.extend_up()
#     edit.copy()
# copy down: 
#     edit.extend_down()
#     edit.copy()
copy word left: 
    edit.extend_word_left()
    edit.copy()
copy word right: 
    edit.extend_word_right()
    edit.copy()
#cut commands
cut all: 
    edit.select_all()
    edit.cut()

cut word left: 
    edit.extend_word_left()
    edit.cut()

cut word right: 
    edit.extend_word_right()
    edit.cut()

paste over all:
    edit.select_all()
    edit.paste()

paste over right:
    key(shift-end)
    sleep(100ms)
    key(delete)
    sleep(100ms)
    edit.paste()


(copy|copier) right:
    key(shift-end)
    sleep(100ms)
    edit.copy()

(cut|scissors) right:
    key(shift-end)
    sleep(100ms)
    edit.cut()  

clear right:
    key(shift-end)
    sleep(100ms)
    key(delete)

clear left:
    key(shift-home)
    sleep(100ms)
    key(delete)

paste plain:
    key(cmd-shift-v)
    sleep(200ms)

bottom:
    key("cmd-down")

topper:
    key("cmd-up")

(dawn|rise): edit.line_start()
(dusk|fall): edit.line_end()

splash: 
    edit.line_end()
    insert(",")

underline: key("cmd-u")
bold: key("cmd-b")
italic: key("cmd-i")

# tiny enter
squeeze: key(shift-enter)