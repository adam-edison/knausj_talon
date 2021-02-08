win.title: /\| Quire/
-

details: key(space)
child task: key(shift-enter)
new task: key(enter)
inside: key(right)
outside: key(left)
lower: key(down)
higher: key(up)

my tasks:
    key("=")

assign:
    insert("@")

status:
    insert("/")

tag:
    insert("#")

due date:
    insert("<")

priority:
    insert("!")

sub list:
    insert("^")

project:
    insert(">")

title:
    key(alt-enter)

description:
    key(d)

toggle [(advanced|simple)]:
    key(alt)

progress:
    key("/")
    sleep(200ms)
    key(down)
    key(enter)

complete:
    key(cmd-/)

postpone one:
    key(down)
    insert("<")
    sleep(200ms)
    insert(user.date_mdy_format(1))
    sleep(100ms)
    key(enter)

postpone:
    insert("<")
    sleep(200ms)
    insert(user.date_mdy_format(1))
    sleep(100ms)
    key(enter)

postpone <number> [days]:
    insert("<")
    sleep(200ms)
    insert(user.date_mdy_format(number))
    sleep(100ms)
    key(enter)

today next:
    key(down)
    insert("<")
    sleep(200ms)
    insert(user.date_mdy_format())
    sleep(100ms)
    key(enter)

today:
    insert("<")
    sleep(200ms)
    insert(user.date_mdy_format())
    sleep(100ms)
    key(enter)

# TODO: AGE: need to re do this as a regular expression replacement by selecting the whole description
# if something takes up more than one line as a check item it really messes this up
check <number>:
    key(d)
    sleep(200ms)
    key(cmd-up)
    key(down)
    repeat(number - 2)
    
    key(home)
    sleep(100ms)
    key(right:3)
    sleep(50ms)
    key(delete)
    sleep(50ms)
    insert("x")
    sleep(100ms)
    key(cmd-enter)

search:
    key(s)

comment:
    key(c)

zoom in:
    key(z)

zoom out:
    key(a)

reply with quote: 
    key(ctrl-q)

next list: insert(")")
last list: insert("(")

delete this:
    key(cmd-delete)

# TODO: AGE set date tomorrow
# TODO: AGE set time <number as military time> 
# TODO: AGE postpone <number days to add to today>
# TODO: AGE - make a voice command to click the checkbox in quire that is the highest in the screen