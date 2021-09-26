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

mod.list('web_links', desc='URLs to visit in a browser')
ctx.lists['self.web_links'] = {
    "my subtasks": "https://touchtown.atlassian.net/issues/?filter=12094",
    "quire": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=Planned",
    "now": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=In+Progress",
    "admin": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=Planned&tag=Admin",
    "chores": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=Planned&tag=Chores",
    "food": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=Planned&tag=Food+and+Medication",
    "exercise": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=Planned&tag=Exercise",
    "meditation": "https://quire.io/w/Personal-0987?sublist=Today&group=date&sort=date&filter=Planned&tag=Meditation",
    "finances": "https://docs.google.com/spreadsheets/d/1ci-nY3Nq4WfZUEFsxJjND8lee7vnqf15lKNuWrvcAhE/edit?usp=sharing",
    "slack": "https://app.slack.com/client/T7FPSMV8F/C7ENXA7C4",
    "sprint board": "https://touchtown.atlassian.net/secure/RapidBoard.jspa?rapidView=51&quickFilter=84",
    "backlog": "https://touchtown.atlassian.net/secure/RapidBoard.jspa?rapidView=51&view=planning.nodetail&selectedIssue=TTDEV-362&epics=visible&issueLimit=100&selectedEpic=TTDEV-93",
    "drive": "https://drive.google.com/drive/my-drive",
    "sleep log": "https://docs.google.com/spreadsheets/d/1BglPUb7S8WByykr6Q6inHy9Af6U5Tl8uTqaAdooSbD0/edit#gid=0",
    "bit bucket": "https://bitbucket.org/dashboard/overview",
    "confluence": "https://touchtown.atlassian.net/wiki/home",
    "teamup": "https://teamup.com/c/zxmaf9/personal",
    "work load": "https://touchtown.atlassian.net/secure/ConfigureReport.jspa?developer=5d52cc4c9ca6120db899542d&subtaskInclusion=onlyAssigned&selectedProjectId=10230&reportKey=com.atlassian.jira.plugin.system.reports%3Adeveloper-workload&Next=Next"
}


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
