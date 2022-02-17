from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()

mod.list('gmail_labels', desc='names of gmail labels')
mod.list('gmail_links', desc='text of common links')

ctx.lists['self.gmail_labels'] = {
    "pull requests": "pull requests",
    "inbox": "inbox",
}

ctx.lists['self.gmail_links'] = {
    "github": "view it on github",
}
