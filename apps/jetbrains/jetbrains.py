import os
import os.path
import requests
import time
import re
from pathlib import Path
from talon import ctrl, ui, Module, Context, actions, clip
import tempfile

# Courtesy of https://github.com/anonfunc/talon-user/blob/master/apps/jetbrains.py

ctx = Context()
mod = Module()

mod.apps.jetbrains = "app.name: /jetbrains/"
mod.apps.jetbrains = "app.name: IntelliJ IDEA"
mod.apps.jetbrains = "app.name: PyCharm"
mod.apps.jetbrains = "app.name: RubyMine"
mod.apps.jetbrains = "app.name: RubyMine-EAP"
mod.apps.jetbrains = """
os: mac
and app.bundle: com.google.android.studio
"""
# windows
mod.apps.jetbrains = "app.name: idea64.exe"
mod.apps.jetbrains = "app.name: PyCharm64.exe"
mod.apps.jetbrains = "app.name: pycharm64.exe"
mod.apps.jetbrains = "app.name: webstorm64.exe"
mod.apps.jetbrains = """
os: mac
and app.bundle: com.jetbrains.pycharm
"""



ctx.matches = r"""
app: jetbrains
"""

class AppActions:
    def tab_next():     actions.user.idea('action NextTab')
    def tab_previous(): actions.user.idea('action PreviousTab')
    
    def tab_close():    actions.user.idea('action CloseContent')
    def tab_reopen():   actions.user.idea('action ReopenClosedTab')

        
@ctx.action_class('code')
class CodeActions:
    #talon code actions
    def toggle_comment(): actions.user.idea('action CommentByLineComment')

@ctx.action_class('edit')
class EditActions:
    #talon edit actions
    def find_next():              actions.user.idea('action FindNext')
    def find_previous():          actions.user.idea('action FindPrevious')
    def find(text: str=None):     actions.user.idea('action Find')
    def line_clone():             actions.key("cmd-d")
    def line_swap_down():         actions.user.idea('action MoveLineDown')
    def line_swap_up():           actions.user.idea('action MoveLineUp')
    def indent_more():            actions.user.idea('action EditorIndentLineOrSelection')
    def indent_less():            actions.user.idea('action EditorUnindentSelection')
    def select_line(n: int=None): actions.user.idea('action EditorSelectLine')
    def select_word():            actions.user.idea('action EditorSelectWord')
    def select_all():             actions.user.idea('action $SelectAll')
    def file_start():             actions.user.idea('action EditorTextStart')
    def file_end():               actions.user.idea('action EditorTextEnd')
    def extend_file_start():      actions.user.idea('action EditorTextStartWithSelection')
    def extend_file_end():        actions.user.idea('action EditorTextEndWithSelection')
    def jump_line(n: int):
        actions.key('cmd-l')
        actions.sleep('300ms')
        actions.insert(n)
        actions.sleep('200ms')
        actions.key('enter')
        # move the cursor to the first nonwhite space character of the line
        actions.key('end')
        actions.sleep('100ms')
        actions.key('home')



@ctx.action_class("win")
class WinActions:
    def filename():
        title = actions.win.title()
        # result = re.search("(.*) - (.*)/((.*).[a-z]+)", title) # for 2019
        result = re.search("(.*) [\\W]+ ([\\w]*)\.([\\w]*)( \\[.*\\])*", title) # for 2021

        if result != None:
            file = result.groups()[1] + "." + result.groups()[2]
            # print("file: " + file)
            return file

        return ""


# @ctx.action_class("edit")
# class edit_actions:
#     def jump_line(n: int):
#         actions.user.idea("goto {} 0".format(n))
#         # move the cursor to the first nonwhite space character of the line
#         actions.user.idea("action EditorLineEnd")
#         actions.user.idea("action EditorLineStart")


@ctx.action_class("user")
class UserActions:
    def tab_jump(number: int):
        # depends on plugin GoToTabs
        if number < 10:
            actions.user.idea("action GoToTab{}".format(number))

    def extend_until_line(line: int):
        actions.user.idea("extend {}".format(line))

    def select_range(line_start: int, line_end: int):
        # if it's a single line, select the entire thing including the ending new-line5
        if line_start == line_end:
            actions.user.idea("goto {} 0".format(line_start))
            actions.user.idea("action EditorSelectLine"),
        else:
            actions.user.idea("range {} {}".format(line_start, line_end))

    def extend_camel_left():
        actions.user.idea("action EditorPreviousWordInDifferentHumpsModeWithSelection")

    def extend_camel_right():
        actions.user.idea("action EditorNextWordInDifferentHumpsModeWithSelection")

    def camel_left():
        actions.user.idea("action EditorPreviousWordInDifferentHumpsMode")

    def camel_right():
        actions.user.idea("action EditorNextWordInDifferentHumpsMode")

