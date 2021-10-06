app: chrome
-

# for vimium in chrome
# fine (f) --> show letters for navigation
# esc --> get rid of cursor in text box

(nav|navi)$: "f"

hover nav$: "p"

go nav:
	key("esc")
	sleep(20ms)
	key("f")

go nav new: 
	key("esc")
	sleep(20ms)
	key(shift-f)

nav new: 
	key(shift-f)