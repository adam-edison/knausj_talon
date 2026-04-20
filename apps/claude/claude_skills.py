"""
Claude skills:
- auto-generate spoken forms from ~/.claude/commands/*.md
- keep list fresh with a file watcher
- provide freeform slash insertion fallback
"""

import os
import re
from pathlib import Path

from talon import Module, actions, app, fs, settings

mod = Module()
_watching_commands_dir = False

mod.list("claude_skills", desc="List of Claude skill commands")


@mod.capture(rule="{user.claude_skills}")
def claude_skills(m) -> str:
    """Capture for Claude skills list."""
    return m.claude_skills


mod.setting(
    "claude_commands_directory",
    type=str,
    default="~/.claude/commands",
    desc="Directory containing Claude command .md files",
)


def get_claude_skills_generated_file() -> Path:
    """Path to auto-generated skills list file."""
    return Path(__file__).with_name("claude_skills_generated.talon-list")


def filename_to_spoken_form(filename: str) -> str:
    """Convert a filename into a spoken form."""
    name = filename.rsplit(".", 1)[0]
    name = re.sub(r"[-_]", " ", name)
    return name.lower()


def _is_markdown_file(path: Path) -> bool:
    return path.suffix.lower() == ".md" and path.is_file()


def find_command_files(commands_dir: Path) -> list[Path]:
    """Find all markdown command files in the commands directory."""
    if not commands_dir.exists() or not commands_dir.is_dir():
        return []
    return sorted(path for path in commands_dir.iterdir() if _is_markdown_file(path))


def generate_claude_skills():
    """Scan ~/.claude/commands and write a Talon list file."""
    commands_dir = Path(os.path.expanduser(settings.get("user.claude_commands_directory")))
    command_files = find_command_files(commands_dir)

    spoken_forms = {}
    for cmd_file in command_files:
        spoken_form = filename_to_spoken_form(cmd_file.name)
        spoken_forms[spoken_form] = cmd_file.stem

    skills_file = get_claude_skills_generated_file()
    with open(skills_file, "w", encoding="utf-8") as file:
        file.write("list: user.claude_skills\n")
        file.write("-\n")
        for spoken_form, skill_name in sorted(spoken_forms.items()):
            file.write(f"{spoken_form}: {skill_name}\n")

    print(
        f"claude_skills: generated {len(spoken_forms)} skills from "
        f"{commands_dir} -> {skills_file}"
    )


def _on_commands_dir_change(name, _flags):
    changed_path = Path(name)
    if changed_path.suffix.lower() != ".md":
        return
    generate_claude_skills()


def _watch_commands_dir():
    global _watching_commands_dir
    if _watching_commands_dir:
        return

    commands_dir = Path(os.path.expanduser(settings.get("user.claude_commands_directory")))
    if not commands_dir.exists() or not commands_dir.is_dir():
        return

    fs.watch(str(commands_dir), _on_commands_dir_change)
    _watching_commands_dir = True


def on_ready():
    generate_claude_skills()
    _watch_commands_dir()


@mod.action_class
class Actions:
    def claude_skill_insert(text: str):
        """Insert / followed by words joined with hyphens, then tab."""
        hyphenated = "-".join(text.strip().lower().split())
        actions.insert(f"/{hyphenated}")
        actions.key("tab")

    def claude_skills_generate():
        """Regenerate Claude skills list from ~/.claude/commands."""
        generate_claude_skills()
        app.notify("Claude skills list refreshed")


app.register("ready", on_ready)
