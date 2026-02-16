"""
Claude skill command: insert a slash followed by hyphenated words (e.g. "audit privacy" -> "/audit-privacy").
"""

from talon import Module, actions

mod = Module()


@mod.action_class
class Actions:
    def claude_skill_insert(text: str):
        """Insert / followed by words joined with hyphens, then tab."""
        hyphenated = "-".join(text.strip().lower().split())
        actions.insert(f"/{hyphenated}")
        actions.key("tab")
