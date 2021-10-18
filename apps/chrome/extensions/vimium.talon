app: chrome
-

# for vimium in chrome
# fine (f) --> show letters for navigation
# esc --> get rid of cursor in text box

(vim|vimmy)$: "f"

hover vim$: "p"

go vim$:
	key("esc")
	sleep(20ms)
	key("f")

go vim new$: 
	key("esc")
	sleep(20ms)
	key(shift-f)

vim new$: 
	key(shift-f)