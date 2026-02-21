tag: terminal
-
# Claude skill command: say "do <words>" to insert /word-word-word and tab

do <user.text>:
    user.claude_skill_insert(text)

clean <user.text>:
    insert("/clear\n")
    sleep(100ms)
    user.claude_skill_insert(text)
