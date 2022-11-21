os: mac
app: chrome
# win.title: /Adam.*kasa\.com/
-

# [unlock] last pass [sign in]:
#    user.switcher_focus("Chrome - Adam")

password kasa: 
    key(cmd-shift-x)
    sleep(100ms)
    insert("kasa lastpass")
    sleep(100ms)
    key(right tab tab enter)
    sleep(100ms)
    key(esc)
    key(cmd-`)
