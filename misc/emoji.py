from datetime import timedelta, date, datetime
from talon import ctrl, ui, Module, actions, Context

mod = Module()
ctx = Context()

mod.list('emoji_names', desc='names of emojis')

ctx.lists['self.emoji_names'] = {
    "complete": "✅",
    "check": "✅",
    "in progress": "🚧",
    "working": "🚧",
    "skip": "⏩",
    "green": "🟢",
    "red": "🔴",
    "blocked": "🔴",
    "waiting": "🫖",
    "smiley": "😀",
    "current": "⭐️",
    "star": "⭐️",
}


@mod.action_class
class Actions:
    def emoji_mark_line(emoji: str):
        """Adds an emoji and a space to the beginning of the current line"""
        actions.key("end")
        actions.sleep("20ms")
        actions.key("home")
        actions.sleep("20ms")
        Actions.emoji_insert_spaced(emoji)

    def emoji_insert_spaced(emoji: str):
        """Inserts an emoji and a space"""
        Actions.emoji_insert(emoji)
        actions.sleep("10ms")
        actions.insert(" ")

    def emoji_insert(emoji: str):
        """Inserts an emoji"""
        actions.user.paste(emoji)

    def emoji_clear_line():
        """Clears the emoji and a space at the beginning of the current line"""
        actions.key("end")
        actions.sleep("10ms")
        actions.key("home")
        actions.sleep("10ms")
        actions.key("delete:2")
