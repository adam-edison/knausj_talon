os: mac
app: Logic Pro
-

record: key(r)
repeat once: key(cmd-r)
cycle: "c"
beginning: "\n"
inspect: "i"

punch in: key(ctrl-alt-cmd-i)
punch out: key(ctrl-alt-cmd-o)

marker: key(alt-')
marker <user.text>:
    title = user.formatted_text(text, "CAPITALIZE_ALL_WORDS")
    key(alt-')
    sleep(50ms)
    key(shift-')
    sleep(50ms)
    insert(title)
    sleep(50ms)
    key(enter)

mark region: key(alt-shift-')