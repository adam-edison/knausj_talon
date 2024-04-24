from talon import Context, Module, actions
import re

ctx = Context()
mod = Module()

@ctx.action_class("user")
class UserActions:
    def line_parse_link():
        """Parse the current line and extract the first link"""
        actions.edit.copy_line()
        actions.sleep("200ms")
        contents = actions.clipboard.get()
        
        # Regex pattern to find URLs, matching both 'http' and 'https'
        pattern = r"https?://[^\s\)]+"
        match = re.search(pattern, contents)
        if match:
            return match.group()
        return None