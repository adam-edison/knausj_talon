from talon import Context, Module, actions, app, clip

ctx = Context()
mod = Module()

ctx.matches = r"""
app: vscode
"""

mod.list("pnpm_filters", "named filters for pnpm working in various repositories")

ctx.lists["user.pnpm_filters"] = {
    "web": "@timeblock.life/timeblock-web-ui",
    "api": "@timeblock.life/timeblock-api",
    "shared": "@timeblock.life/shared",
}


@mod.action_class
class Actions:
    def pnpm_run_with_filter(filter: str, command: str):
        """Run pnpm with a filter"""
        actions.user.vscode_terminal(1)
        actions.insert(f"pnpm run --filter='{filter}' {command}\n")

    def clean_jest_object_paste():
        """Take clipboard code and clean it up from jest diff"""
        contents = clip.get()
        # replace + with nothing
        clean = (
            contents.replace("+", "")
            .replace("Object", "")
            .replace("Array", "")
        )
        actions.user.paste(clean)
