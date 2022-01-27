from multiprocessing.dummy import Array
import re
from talon import ctrl, ui, Module, Context, actions, clip
import itertools
from typing import Union

ctx = Context()
mod = Module()

mod.list('pair_symbols', desc='symbols that can be found in pairs in code')
ctx.lists['self.pair_symbols'] = {
    "dot": "\.1\.",
    "pair": "\(1\)",
    "brace": "\\{{1\\}}",
    "square": "\[1\]",
    "quote": "'1'",
    "dub": '"1"',
    "coal": ':1:',
    "spike": "<1>",
}

# declared functions accessible from talon file as user.<function name>


@ mod.action_class
class Actions:
    def caret_before(element: str, occurrence: int = 1):
        """places the cursor on the current line before the first occurrence of element"""
        line = get_line_text().lower()
        positions = get_all_occurrences_positions(element, line)

        actions.key("end")
        actions.sleep("100ms")
        actions.key("home")
        actions.sleep("100ms")

        actions.key(f"""right:{positions[occurrence-1]}""")

    def caret_after(element: str, occurrence: int = 1):
        """places the cursor on the current line after the first occurrence of element"""
        Actions.caret_before(element, occurrence)
        actions.key("right")

    def caret_select_between(pair_symbols: Array):
        """selects all text between first pair of symbols found"""
        haystack = get_line_text().lower()
        pair = pair_symbols.split("1")
        print(f"{pair}")
        left_symbol = pair[0]
        right_symbol = pair[1]

        left_positions = get_all_occurrences_positions(left_symbol, haystack)
        right_positions = get_all_occurrences_positions(right_symbol, haystack)
        start = left_positions[0]

        if pair[0] == pair[1]:
            end = left_positions[1]
        else:
            end = right_positions[0]

        print(f"found at {start} and {end}")
        actions.key("end")
        actions.sleep("100ms")
        actions.key("home")
        actions.sleep("100ms")

        actions.key(f"""right:{start + 1}""")
        actions.key(f"""shift-right:{end - start - 1}""")


# defined outside the class so it is effectively private


def regex_escape(text):
    result = ""

    for character in list(text):
        if character in ".([{":
            result += f"\\{character}"
        else:
            result += character

    return result


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
