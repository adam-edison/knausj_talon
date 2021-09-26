os: mac
app: chrome
-
tag(): browser
tag(): user.tabs

settings():
    key_wait = 2
    
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
