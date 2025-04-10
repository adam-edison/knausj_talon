os: mac
app: slack
-

channel <user.text>:
  key(cmd-k)
  sleep(300ms)
  insert("{text}")
  key(enter)

slack home:
  key(ctrl-1)

react {user.slack_reactions}: user.slack_emoji_reaction(slack_reactions)
