tag: terminal
-
# Claude skill commands
# Uses generated list from ~/.claude/commands/, with freeform fallback

# List-based command takes priority (exact matches)
skill {user.claude_skills}:
    insert("/{claude_skills}")
    key(tab)

# Freeform fallback for skills not in the list
skill <user.text>:
    insert("/{text}")
    key(tab)

# Manual refresh command
refresh skills: user.claude_skills_generate()
