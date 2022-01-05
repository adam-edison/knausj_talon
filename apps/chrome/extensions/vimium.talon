app: chrome
-

# for vimium in chrome
# f --> show letters for navigation
# esc --> get rid of cursor in text box

hover letters$: "p"

letters$:
	key("esc")
	sleep(20ms)
	key("f")

alpha$: "f"
