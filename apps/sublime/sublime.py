import re
from talon import Context, actions, Module

mod = Module()
ctx = Context()

apps = mod.apps
apps.sublime = """
os: mac
and app.name: Sublime Text
"""

ctx.matches = r"""
app: sublime
"""

@ctx.action_class("win")
class win_actions:
    def filename():
        return actions.win.title()

    def file_ext():
        result = actions.win.filename().split(".")[-1]
        return result

@ctx.action_class("edit")
class edit_actions:
    def jump_line(n: int):
        actions.key("ctrl-g")
        actions.insert(str(n))
        actions.key("enter")

    def find(text: str):
        actions.key("ctrl-f")
        actions.insert(text)