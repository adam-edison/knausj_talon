from talon import Module, Context, actions

mod = Module()
ctx = Context()

ctx.matches = """
title: /^Don't Starve$/
"""


@mod.action_class
class Actions:
    def starve_hold_action():
        """Holds down the auto action button (space)"""
        actions.key("space:up")
        actions.sleep("50ms")
        actions.key("space:down")

    def starve_release_action():
        """Releases the action button (space)"""
        actions.key("space:up")

    def starve_move_north():
        """Holds the up key"""
        actions.key("w:down")

    def starve_move_south():
        """Holds the down key"""
        actions.key("s:down")

    def starve_move_west():
        """Holds the left key"""
        actions.key("a:down")

    def starve_move_east():
        """Holds the right key"""
        actions.key("d:down")

    def starve_move_northeast():
        """Holds the up and right keys"""
        actions.key("w:down d:down")

    def starve_move_northwest():
        """Holds the up and left keys"""
        actions.key("w:down a:down")

    def starve_move_southeast():
        """Holds the down and right keys"""
        actions.key("s:down d:down")

    def starve_move_southwest():
        """Holds the down and left keys"""
        actions.key("s:down a:down")

    def starve_stop():
        """Releases all keys"""
        actions.key("w:up s:up a:up d:up")
