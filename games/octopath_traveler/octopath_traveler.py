from talon import Module, Context, actions

mod = Module()
ctx = Context()

ctx.matches = """
title: /OCTOPATH TRAVELER/
"""

@mod.action_class
class Actions:
    def advance_dialog(delaySeconds: int):
        "Advances dialog [times] every [delaySeconds]"
        actions.key("enter")
        milliseconds = delaySeconds * 1000
        actions.sleep(f"{milliseconds}ms")

