from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()

mod.apps.chrome = "app.name: Google Chrome"
mod.apps.chrome = """
os: windows
and app.name: Google Chrome
os: windows
and app.exe: chrome.exe
"""
mod.apps.chrome = """
os: mac
and app.bundle: com.google.Chrome
"""
ctx.matches = r"""
app: chrome
"""


@mod.action_class
class Actions:
    def open_link_new_tab(link: str):
        """opens the link in a new tab"""
        actions.key("cmd-t")
        actions.sleep("100ms")
        actions.user.paste(link)
        actions.sleep("100ms")
        actions.key("enter")

    def open_link_current_tab(link: str):
        """opens the link in the current tab"""
        actions.key("cmd-l")
        actions.user.paste(link)
        actions.sleep("100ms")
        actions.key("enter")

    def select_text_element(search: str):
        """selects the element by text search"""
        actions.key("cmd-f")
        actions.sleep("100ms")
        actions.user.paste(search)
        actions.sleep("100ms")
        actions.key("enter")
        actions.sleep("100ms")
        actions.key("esc")

    def trigger_text_element(search: str):
        """triggers the element by search and enter"""
        Actions.select_text_element(search)
        actions.sleep("100ms")
        actions.key("enter")

    def trigger_link_text(search: str):
        """triggers link by search and enter"""
        actions.key("cmd-f")
        actions.sleep("100ms")
        actions.user.paste(search)
        actions.sleep("100ms")
        actions.key("enter")


@ctx.action_class("user")
class user_actions:
    def tab_jump(number: int):
        if number < 9:
            if app.platform == "mac":
                actions.key("cmd-{}".format(number))
            else:
                actions.key("ctrl-{}".format(number))

    def tab_final():
        if app.platform == "mac":
            actions.key("cmd-9")
        else:
            actions.key("ctrl-9")


@ctx.action_class("browser")
class browser_actions:
    def go(url: str):
        actions.browser.focus_address()
        actions.sleep("50ms")
        actions.insert(url)
        actions.key("enter")
