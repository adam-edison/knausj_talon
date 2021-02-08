tag: user.tabs
-
tab (open | new): app.tab_open()
tab last: app.tab_previous()
tab next: app.tab_next()
tab close: app.tab_close()
tab (reopen|restore): app.tab_reopen()
tab <number>: user.tab_jump(number)
tab final: user.tab_final()


tab close next:
    app.tab_next()
    app.tab_close()
tab close last:
    app.tab_previous()
    app.tab_close()
tab close final: 
    user.tab_final()
    app.tab_close()
