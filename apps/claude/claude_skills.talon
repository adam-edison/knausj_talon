tag: terminal
-
# Claude skill command: say "do <words>" to insert /word-word-word and tab

chat <user.text>:
    user.claude_skill_insert(text)

chat clear <user.text>:
    insert("/clear\n")
    sleep(100ms)
    user.claude_skill_insert(text)
