win.title: /(- JIRA)|(Task Assignment)/
-

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

scroll down:
    user.mouse_move(671, 441)
    sleep(200ms)
    user.mouse_scroll_up()
    repeat(5)

complete:
    key(home)
    sleep(200ms)
    insert(":white_check_:")
    sleep(100ms)
    key(enter)

mark skipped:
    key(home)
    sleep(200ms)
    insert(":fast_for:")
    sleep(100ms)
    key(enter)

(in progress|working):
    key(home)
    sleep(200ms)
    insert(":construction:")
    sleep(100ms)

# make these assign to <list> and insert list item

assign me:
    key(a)
    sleep(200ms)
    insert("adam e")
    sleep(1000ms)
    key(enter)

assign none:
    key(a)
    sleep(200ms)
    insert("Unassigned")
    sleep(1500ms)
    key(enter)

assign golden:
    key(a)
    sleep(200ms)
    insert("golden")
    sleep(1000ms)
    key(enter)

bdd tests:
    key(cmd-u)
    insert("BDD Tests")
    key(enter)

assign tice:
    key(a)
    sleep(200ms)
    insert("theis")
    sleep(1000ms)
    key(enter)

assign kercher:
    key(a)
    sleep(200ms)
    insert("kercher")
    sleep(1000ms)
    key(enter)

assign drake:
    key(a)
    sleep(200ms)
    insert("drake")
    sleep(1000ms)
    key(enter)

assign alex:
    key(a)
    sleep(200ms)
    insert("alex")
    sleep(1000ms)
    key(enter)

assign nicole:
    key(a)
    sleep(200ms)
    insert("nicole")
    sleep(1000ms)
    key(enter)

tap save: ""

focus center:
    user.mouse_move(969, 182)
	mouse_click()

subtask code review:
    insert("Code Review\n")
    sleep(3000ms)
    insert("PR Feedback\n")
    sleep(3000ms)

subtask two code reviews:
    insert("Code Reviewer #1\n")
    sleep(3000ms)
    insert("Code Reviewer #2\n")
    sleep(3000ms)
    insert("PR Feedback\n"
    sleep(3000ms)

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