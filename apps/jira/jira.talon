win.title: /(JIRA)|(Task Assignment)/
-
settings():
    key_wait = 2.6

zero time:
    key(tab)
    insert("0m")
    sleep(200ms)
    key(tab enter)

link this clip:
    key(cmd-k)
    sleep(100ms)
    edit.paste()
    sleep(1000ms)
    key(enter)

description:
    user.mouse_move(671, 441)
    mouse_click()

(scrounge|scroll down):
    user.mouse_move(671, 441)
    sleep(200ms)
    user.mouse_scroll_up()
    repeat(5)

mark complete:
    key(home)
    sleep(200ms)
    insert(":")
    sleep(200ms)
    insert("white_check")
    sleep(100ms)
    key(enter)

mark skipped:
    key(home)
    sleep(200ms)
    insert(":fast_for:")
    sleep(100ms)
    key(enter)

mark clear:
    key(home)
    sleep(200ms)
    key(delete)

mark space:
    key(home)
    sleep(10ms)
    key(home)
    sleep(10ms)
    key(end)
    sleep(100ms)
    key(left)
    key(space)
    key(left)    

mark (in progress|working):
    key(home)
    sleep(200ms)
    insert(":")
    sleep(200ms)
    insert("construction")
    sleep(100ms)
    key(enter)

# make these assign to <list> and insert list item

assign to me:
    key(a)
    sleep(200ms)
    insert("adam e")
    sleep(1000ms)
    key(enter)

assign to none:
    key(a)
    sleep(200ms)
    insert("Unassigned")
    sleep(1500ms)
    key(enter)

assign to golden:
    key(a)
    sleep(200ms)
    insert("golden")
    sleep(1000ms)
    key(enter)

bdd tests:
    key(cmd-u)
    insert("BDD Tests")
    key(enter)

assign (to theis|tice):
    key(a)
    sleep(200ms)
    insert("theis")
    sleep(1000ms)
    key(enter)

assign to kercher:
    key(a)
    sleep(200ms)
    insert("kercher")
    sleep(1000ms)
    key(enter)

assign to drake:
    key(a)
    sleep(200ms)
    insert("drake")
    sleep(1000ms)
    key(enter)

assign to alex:
    key(a)
    sleep(200ms)
    insert("alex")
    sleep(1000ms)
    key(enter)

assign to nicole:
    key(a)
    sleep(200ms)
    insert("nicole")
    sleep(1000ms)
    key(enter)

assign to lindsey:
    key(a)
    sleep(200ms)
    insert("stuck")
    sleep(1000ms)
    key(enter)

tap save: ""

focus center:
    user.mouse_move(969, 182)
	mouse_click()

subtask single:
    user.hover_center_image("jira-create-subtask")
    mouse_click()
    sleep(1000ms)
    insert("Code Review\n")
    sleep(1000ms)
    insert("PR Feedback\n")
    sleep(1000ms)

subtask double:
    user.hover_center_image("jira-create-subtask")
    mouse_click()
    sleep(1000ms)
    insert("Code Reviewer #1\n")
    sleep(1000ms)
    insert("Code Reviewer #2\n")
    sleep(1000ms)
    insert("PR Feedback\n")
    sleep(1000ms)

create subtask:
    user.hover_center_image("jira-create-subtask")
    mouse_click()

estimate <number>:
    user.hover_center_image("jira-original-estimate")
    sleep(1000ms)
    user.mouse_move_relative(200, 0)
    sleep(100ms)
    mouse_click()
    sleep(200ms)
    key(cmd-a)
    key(delete)
    insert("{number}h\n")

tasks section:
    key(cmd-b)
    sleep(10ms)
    key(cmd-u)
    insert("Tasks\n")
    sleep(20ms)
    insert("* ")

paste comment:
    insert("m")
    sleep(1000ms)
    edit.paste()