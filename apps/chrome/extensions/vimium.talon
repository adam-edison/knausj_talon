# for vimium in chrome
# fine (f) --> show letters for navigation
# esc --> get rid of cursor in text box

vim: "f"

vimmy:
	key("esc")
	sleep(20ms)
	key("f")

vimmier: 
	key("esc")
	sleep(20ms)
	key(shift-f)