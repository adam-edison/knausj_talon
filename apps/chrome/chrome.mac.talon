os: mac
app: chrome
-
tag(): browser
tag(): user.tabs

settings():
    key_wait = 2

open {user.website}: user.open_link_new_tab(website)
show {user.website}: user.open_link_current_tab(website)

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
    
tab dupe:
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

# for pasting to previously open tab, assuming Previous Tab extension is installed
paste last:
    edit.copy()
    sleep(200ms)
    key(ctrl-q)
    sleep(200ms)
    edit.paste()

tab switch:
    key(ctrl-q)