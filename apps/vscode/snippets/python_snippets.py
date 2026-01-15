from talon import Context

ctx = Context()
ctx.matches = r"""
app: vscode
tag: user.python
"""

ctx.lists["user.snippets"] = {
    "class funky": "def(class method)",
    "class static funky": "def(class static method)",
    "class": "class",
    "else if": "elif",
    "for": "for",
    "funky": "def",
    "if else": "if/else",
    "if": "if",
    "lambda": "lambda",
    "try except": "try/except",
    "while": "while",
    "with": "with",
}
