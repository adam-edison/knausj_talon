from talon import Module, Context, actions

mod = Module()
ctx = Context()
ctx.matches = """
win.title: /coromon/i
app.name: /coromon/i
"""

parrot_config = {
    "kuh":      ("select", lambda: actions.user.coromon_select()),
    "clop":     ("interact", lambda: actions.user.coromon_interact()),
    "spit":     ("back", lambda: actions.user.coromon_back()),
    "clop kuh": ("logbook", lambda: actions.user.coromon_logbook()),
}


@ctx.action_class("user")
class UserActions:
    def parrot_config():
        print(f"coromon parrot_config called, returning: {list(parrot_config.keys())}")
        return parrot_config


@mod.action_class
class Actions:
    def coromon_select():
        """Confirm / Select / Advance dialogue"""
        actions.key("space")

    def coromon_interact():
        """Interact with objects / NPCs"""
        actions.key("f")

    def coromon_back():
        """Go back to the previous menu"""
        actions.key("escape")

    def coromon_down():
        """Navigate down"""
        actions.key("down")

    def coromon_logbook():
        """Open the logbook menu"""
        actions.key("escape")
        actions.sleep("1000ms")
        actions.key("right")
        actions.sleep("200ms")
        actions.user.key_repeat("down", 4, 120)
        actions.sleep("100ms")
        actions.key("space")
