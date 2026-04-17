tag: terminal
-
# Claude skill command: say "do <words>" to insert /word-word-word and tab

chat <user.text>:
    user.claude_skill_insert(text)

chat clear <user.text>:
    insert("/clear\n")
    sleep(100ms)
    user.claude_skill_insert(text)

chat <number_small>:
    insert("{number_small}\n")

chat show (pr | pull request):
    insert("can you open the pull request in brave for me?\n")

chat show ticket:
    insert("can you open the ticket in brave for me?\n")

chat show project:
    insert("can you open the project in brave for me?\n")