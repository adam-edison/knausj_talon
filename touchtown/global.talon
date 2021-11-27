os: mac
-
web app: "webapp"
web app repo: "tt-webapp"
# how to hit numpad
# key(ctrl-keypad_4)

touch town copy right:
    copyright = "/*\n*  Copyright 2021, Touchtown, Inc.  All rights reserved.\n*  This program is protected by US and International Copyright Laws.\n*/"
    user.paste(copyright)

sublime clean:
    key(cmd-a)
    key(cmd-c)
    user.switcher_focus("sublime")
    sleep(750ms)

    # new file
    key(cmd-n)
    sleep(1000ms)
    key(cmd-v)

    # find and replace
    sleep(200ms)
    key(cmd-alt-f)
    sleep(100ms)

    # clean up common character issues
    insert("\\\\n")
    key(tab)
    key(cmd-a)
    insert("\\n")
    sleep(200ms)
    key(ctrl-alt-enter)

run term:
    edit.copy()
    user.switcher_focus("iterm")
    edit.paste()
    key(enter)

see in term:
    edit.copy()
    user.switcher_focus("iterm")
    edit.paste()

care log:
    sleep(100ms)
    user.switcher_focus("intellij")
    sleep(500ms)
    key(shift-cmd-o)
    sleep(1200ms)
    key(right)
    key(cmd-a)
    insert("pcc.log")
    sleep(300ms)
    key(enter)

kill all notifications:
    user.switcher_focus("iterm2")
    sleep(200ms)
    insert("killall NotificationCenter\n")
    

regex any: "(.*)"

regex any line:
    insert("[\\s\\S]*")

regex not <user.text>:
    insert("^((?!{text}).)*$")

issue [dev] <number>: 
    insert("TTDEV-{number}")

issue prod <number>: 
    insert("TTPROD-{number}")

link to issue [dev] <number>:
    insert("https://touchtown.atlassian.net/browse/TTDEV-{number}")

sublime <number>:
    user.switcher_focus("sublime")
    sleep(750ms)
    edit.jump_line(number)
    sleep(20ms)
    key(end)