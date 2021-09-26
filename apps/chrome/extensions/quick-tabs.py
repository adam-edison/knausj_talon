from talon import Module, Context

mod = Module()
ctx = Context()

mod.list('quick_tabs_keywords', desc='Portions of tab titles that may be present in Chrome')
ctx.lists['self.quick_tabs_keywords'] = {
    "quire": "| Quire",
    "working": "Working | Quire",
    "gmail": "- Gmail",
    "slack": "Slack",
    "issue": "- Jira",
    "jira": "- Jira",
    "bit bucket": "- Bitbucket",
    "drive": "Google Drive",
    "lucid chart": "lucid"
}