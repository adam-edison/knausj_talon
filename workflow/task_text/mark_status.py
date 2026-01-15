from talon import Context, Module, actions, clip
import re

ctx = Context()
mod = Module()

ctx.matches = """
"""

mod.list("task_status", desc="Statuses for task lists")

ctx.lists["user.task_status"] = {
    "done": "✅",
    "complete": "✅",
    "passed": "✅",
    "in progress": "🚧",
    "skipped": "⏭️",
    "blocked": "⛔️",
    "waiting": "⏳",
    "paused": "⏸️",
    "failed": "❌"
}


@mod.action_class
class Actions:
    def mark_clear_status():
        """Remove the status from the current line"""
        actions.user.copy_line()
        actions.sleep("100ms")
        contents = clip.text()

        emoji_is_present = re.search(r"[✅🚧⏭️⛔️⏳⏸️❌]", contents)

        if not emoji_is_present:
            return

        emoji_position = emoji_is_present.end()

        actions.edit.line_start()
        actions.sleep("15ms")

        for i in range(emoji_position - 1):
            actions.edit.right()
            actions.sleep("15ms")

        actions.edit.delete_right()
        actions.sleep("50ms")

        if contents[emoji_position] == " ":
            actions.edit.delete_right()

    def mark_status(status_emoji: str):
        """Parse the current line and mark or change a status"""
        actions.user.mark_clear_status()

        actions.user.copy_line()
        actions.sleep("100ms")
        contents = clip.text()

        star_is_present = re.match(r"^[\s]*\*", contents)
        dash_is_present = re.match(r"^[\s]*-", contents)

        leading_whitespace_length = len(re.match(r"^[\s]*", contents).group(0))
        star_length = star_is_present and 2 or 0
        dash_length = dash_is_present and 2 or 0
        total_left_length = leading_whitespace_length + star_length + dash_length

        actions.edit.line_start()
        actions.sleep("50ms")

        for i in range(total_left_length):
            actions.edit.right()
            actions.sleep("15ms")

        actions.insert(f"{status_emoji} ")
