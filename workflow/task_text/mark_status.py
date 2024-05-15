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
        contents = clip.get()

        # check if any status emoji is present
        emoji_is_present = re.search(r"[✅🚧⏭️⛔️⏳⏸️❌]", contents)

        # bail if no emoji found
        if not emoji_is_present:
            return

        # get position after emoji
        emoji_position = emoji_is_present.end()

        # delete the emoji on the line
        actions.edit.line_start()

        for i in range(emoji_position - 1):
            actions.edit.right()
            actions.sleep("15ms")
        
        actions.edit.delete_right()
        actions.sleep("50ms")

        # delete the space after the emoji if present
        if contents[emoji_position] == " ":
            actions.edit.delete_right()
        

    def mark_status(status_emoji: str):
        """Parse the current line and mark or change a status"""
        # clear emoji if present, first
        Actions.mark_clear_status()

        # get the current line
        actions.user.copy_line()
        contents = clip.get()
        
        # Regexes to match line patterns
        
        # plainPattern e.g. "This is a thing" or "    This is a thing"
        # plainPattern = r"^[\s]*([^\s]+)"

        # # plainStatusPattern e.g. "✅ This is a thing" or "    🚧 This is a thing"
        # plainStatusPattern = r"^[\s]*([✅🚧⏭️⛔️]) ([^\s]+)"

        # # starListPattern e.g. "* This is a thing" or "    * This is a thing"
        # starListPattern = r"^[\s]*\* ([^\s]+)"

        # # starListStatusPattern e.g. "* ✅ This is a thing" or "    * 🚧 This is a thing"
        # starListStatusPattern = r"^[\s]*\* ([✅🚧⏭️⛔️]) ([^\s]+)"

        # either replace existing status with given status
        # or insert the status at the beginning of the line
        # do this by using edits and not by pasting over existing content

        star_is_present = re.match(r"[\s]*\*", contents)

        leading_whitespace_length = len(re.match(r"^[\s]*", contents).group(0))
        star_length = star_is_present and 2 or 0
        total_left_length = leading_whitespace_length + star_length

        actions.edit.line_start()
        actions.sleep("50ms")
        
        for i in range(total_left_length):
            actions.edit.right()
            actions.sleep("15ms")

        actions.insert(f"{status_emoji} ")