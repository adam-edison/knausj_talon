os: mac
app: chrome
-
tag(): browser
tag(): user.tabs

settings():
    key_wait = 2

action(browser.bookmark):
	key(cmd-d)

action(browser.bookmark_tabs):
	key(cmd-shift-d)
	
action(browser.bookmarks):
	key(cmd-alt-b)
  
action(browser.bookmarks_bar):
	key(cmd-shift-b)

action(browser.focus_address): 
	key(cmd-l)

action(browser.focus_search):
	browser.focus_address()

action(browser.go_blank):
	key(cmd-n)
	
action(browser.go_back):
	key(cmd-[)

action(browser.go_forward):
	key(cmd-])
	
action(browser.go_home):
	key(cmd-shift-h)

action(browser.open_private_window):
	key(cmd-shift-n)

action(browser.reload):
	key(cmd-r)

action(browser.reload_hard):
	key(cmd-shift-r)

#action(browser.reload_hardest):
	
action(browser.show_clear_cache):
	key(cmd-shift-delete)
  
action(browser.show_downloads):
	key(cmd-shift-j)

#action(browser.show_extensions)

action(browser.show_history):
	key(cmd-y)
	
action(browser.submit_form):
	key(enter)

#action(browser.title)

action(browser.toggle_dev_tools):
	key(cmd-alt-i)

action(edit.line_clone):
	edit.select_line()
	edit.copy()
	key(end)
	sleep(100ms)
	key(enter)
	# need to select next line 
	# because some editors insert bullet points automatically
	# like JIRA, github, etc
	# TODO: AGE should implement specific line clone based upon window title like | JIRA, for example
	edit.select_line()
	key(delete)
	edit.paste()

open {user.web_links}: user.open_link_new_tab("{user.web_links}")
show {user.web_links}: user.open_link_current_tab("{user.web_links}")
	


tab here:
	mouse_click(1)
	sleep(50ms)
	key(down)
	key(enter)
	sleep(100ms)
	key(ctrl-tab)	

copy address:
	browser.focus_address()
	edit.copy()

clone tab:
	browser.focus_address()
	edit.copy()
	sleep(100ms)
	key(cmd-t)
	sleep(300ms)
	edit.paste()
	key(enter)
	sleep(500ms)
	browser.focus_address()

dot com: insert(".com")