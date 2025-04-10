from talon import Context, actions, ctrl, Module

mod = Module()

# Define the list at the module level
mod.list("slack_reactions", desc="Reactions for slack")

ctx = Context()
ctx.matches = r"""
os: mac
app: slack
"""

# Move the list population to the context
ctx.lists["user.slack_reactions"] = {
    "complete": "white_check_mark",
    "done": "white_check_mark",
    "ship": "ship",
    "thumbs up": "thumbsup",
    "thanks": "thankyou",
    "thank you": "thankyou",
    "heart": "heart",
    "looking": "eyes",
    "party": "partydino",
    "one hundred": "100",
}

@mod.action_class
class Actions:
    def slack_emoji_reaction(reaction: str):
        """Reaction for slack"""
        ctrl.mouse_click(button=1)
        actions.sleep("200ms")
        # Use Slack's keyboard shortcut to open emoji picker
        actions.key("r")
        actions.sleep("300ms")
        # Type the emoji name
        actions.insert(reaction)
        actions.sleep("700ms")
        # Press enter to select the first matching emoji
        actions.key("enter")

