from talon import Module, Context, actions

mod = Module()
ctx = Context()

ctx.matches = """
title: /OCTOPATH TRAVELER/
"""

@mod.action_class
class Actions:
    def octopath_advance_dialog(delaySeconds: int):
        "Advances dialog [times] every [delaySeconds]"
        actions.key("enter")
        milliseconds = delaySeconds * 1000
        actions.sleep(f"{milliseconds}ms")

    # best to navigate to the item first, then apply boost before selection
    def octopath_menu(order1: int, order2: int):
        "Chooses [order1] item in first menu, then [order2] item in next menu"

        first = order1 - 1
        second = order2 - 1
        actions.key(f"down:{first}")
        actions.key("enter")
        actions.key(f"down:{second}")
        actions.sleep("500ms")     

    def octopath_list(order1: int):
        "Chooses [order1] item in the menu"

        first = order1 - 1
        actions.key(f"down:{first}")
        actions.key("enter")
