from talon import Context, actions
ctx = Context()
ctx.matches = r"""
os: mac
app: chrome
"""

@ctx.action_class('browser')
class BrowserActions:
    def bookmark():
        actions.key('cmd-d')
    def bookmark_tabs():
        actions.key('cmd-shift-d')
    def bookmarks():
        actions.key('cmd-alt-b')
    def bookmarks_bar():
        actions.key('cmd-shift-b')
    def focus_address():
        actions.key('cmd-l')
    def focus_search():
        actions.browser.focus_address()
    def go_blank():
        actions.key('cmd-n')
    def go_back():
        actions.key('cmd-[')
    def go_forward():
        actions.key('cmd-]')
    def go_home():
        actions.key('cmd-shift-h')
    def open_private_window():
        actions.key('cmd-shift-n')
    def reload():
        actions.key('cmd-r')
    def reload_hard():
        actions.key('cmd-shift-r')
        #action(browser.reload_hardest):
    def show_clear_cache():
        actions.key('cmd-shift-delete')
    def show_downloads():
        actions.key('cmd-shift-j')
        #action(browser.show_extensions)
    def show_history():
        actions.key('cmd-y')
    def submit_form():
        actions.key('enter')
        #action(browser.title)
    def toggle_dev_tools():
        actions.key('cmd-alt-i')

@ctx.action_class('edit')
class EditActions:
    def line_clone():
        actions.edit.select_line()
        actions.edit.copy()
        actions.key('end')
        actions.sleep('100ms')
        actions.key('enter')
        # need to select next line
        # because some editors insert bullet points automatically
        # like JIRA, github, etc
        # TODO: AGE should implement specific line clone based upon window title like | JIRA, for example
        actions.edit.select_line()
        actions.key('delete')
        actions.edit.paste()
