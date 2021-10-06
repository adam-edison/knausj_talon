win.title: /Google Sheets/
-

mark today:
    print("hello")
    insert(user.date_slash_format())
    sleep(200ms)
    key(enter)

cell <user.letters> <number>:
    key(alt-/)
    sleep(150ms)
    insert("go to range")
    sleep(100ms)
    key(enter)
    
    sleep(100ms)
    insert("{letters}{number}")
    sleep(150ms)
    key(enter)
    sleep(150ms)
    key(esc)

edit cell <user.letters> <number>:
    key(alt-/)
    sleep(150ms)
    insert("go to range")
    sleep(100ms)
    key(enter)
    
    sleep(100ms)
    insert("{letters}{number}")
    sleep(150ms)
    key(enter)
    sleep(150ms)
    key(esc)
    sleep(100ms)
    key(f2)

task <user.text> <number> minutes:
    insert("{text}")
    key(right)
    insert("{number}")
    key(down)
    key(left)

go top:
    key(cmd-home)

go bottom:
    key(cmd-end)

next: key(right)

insert row: 
    key(cmd-alt-=)
    sleep(500ms)
    key(up:2)
    sleep(20ms)
    key(enter)