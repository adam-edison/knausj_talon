from talon import Context

ctx = Context()
ctx.matches = r"""
app: vscode
tag: user.csharp
"""

ctx.lists["user.snippets"] = {
    "class": "class",
    "else": "else",
    "for each": "foreach",
    "if": "if",
    "try except": "try",
    "try finally": "tryf",
    "while": "while",
}
