#(jay son | jason ): "json"
#(http | htp): "http"
#tls: "tls"
#M D five: "md5"
#word (regex | rejex): "regex"
#word queue: "queue"
#word eye: "eye"
#word iter: "iter"
#word no: "NULL"
#word cmd: "cmd"
#word dup: "dup"
#word shell: "shell".
zoom in: edit.zoom_in()
zoom out: edit.zoom_out()
(page | scroll) up: key(pgup)
(page | scroll) down: key(pgdown)
(copier|copy that): edit.copy()
(cutter|cut that): edit.cut()
(paster|paste that): edit.paste()
undo that: edit.undo()
redo that: edit.redo()
paste match: edit.paste_match_style()
paste value: key(cmd-shift-v)
file save: edit.save()
wipe: key(backspace)    
(pad | padding): 
	insert("  ") 
	key(left)

slap:
	edit.line_end()
	key(enter)

swipe:
	edit.line_end()
	key(shift-enter)
