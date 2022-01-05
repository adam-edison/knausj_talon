mode: command
win.title: /Current Finances - Google Sheets/
-

settings():
    key_wait = 3

today: 
    insert(user.date_slash_format())
    key(enter)

paste negative:
    key(enter)
    edit.select_all()
    edit.paste()
    key(home)
    insert("-")
    key(enter)

paste positive:
    key(enter)
    edit.select_all()
    edit.paste()
    key(enter)