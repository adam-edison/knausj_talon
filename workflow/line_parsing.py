from talon import Context, Module, actions
import re

ctx = Context()
mod = Module()

@mod.action_class
class UserActions:
    def line_parse_link():
        """Parse the current line and extract the first link"""
        actions.user.copy_line()
        
        # Regex pattern to find URLs, matching both 'http' and 'https'
        pattern = r"https?://[^\s\)]+"
        match = re.search(pattern, contents)
        if match:
            return match.group()
        return None