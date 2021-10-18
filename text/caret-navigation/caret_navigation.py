import re
from talon import ctrl, ui, Module, Context, actions, clip
import itertools
from typing import Union

ctx = Context()
mod = Module()



# declared functions accessible from talon file as user.<function name>
@mod.action_class
class Actions:
    def caret_before(element: str, occurrence:int=1):
        """places the cursor on the current line before the first occurrence of element"""
        line = get_line_text().lower()
        positions = get_all_occurrences_positions(element, line)

        actions.key("end")
        actions.sleep("100ms")
        actions.key("home")
        actions.sleep("100ms")

        actions.key(f"""right:{positions[occurrence-1]}""")

    def caret_after(element: str, occurrence:int=1):
        """places the cursor on the current line after the first occurrence of element"""
        line = get_line_text().lower
        positions = get_all_occurrences_positions(element, line)
        actions.key("end")
        actions.sleep("100ms")
        actions.key("home")
        actions.sleep("100ms")
        actions.key(f"""right:{positions[occurrence-1] + 1}""")

# defined outside the class so it is effectively private
def get_line_text():
    temporary = clip.text()

    actions.key("end")
    actions.key("shift-home")
    actions.sleep("200ms")
    actions.edit.copy()
    actions.sleep("200ms")
    lineText = clip.text()

    clip.set(temporary)
    return lineText

def get_all_occurrences_positions(needle, haystack):
    return [m.start() for m in re.finditer(needle, haystack)]