"""
Auto-generates a list of Claude skill commands for voice navigation.

Scans ~/.claude/commands/ for .md files and creates spoken forms
based on the filename (e.g., branch-and-implement.md -> "branch and implement").

The generated list is saved to claude_skills-<hostname>.talon-list
"""

import os
import re
from pathlib import Path

from talon import Module, actions, app, settings

mod = Module()

mod.list("claude_skills", desc="List of Claude skill commands")


@mod.capture(rule="{user.claude_skills}")
def claude_skills(m) -> str:
    """Capture for Claude skills list"""
    return m.claude_skills


mod.setting(
    "claude_commands_directory",
    type=str,
    default="~/.claude/commands",
    desc="Directory containing Claude command .md files",
)

mod.setting(
    "claude_skills_auto_generate",
    type=bool,
    default=True,
    desc="Automatically generate Claude skills on Talon startup",
)


def get_claude_skills_file() -> Path:
    """Get the path to the claude_skills talon-list file for this host."""
    hostname = actions.user.talon_get_hostname()
    return Path(__file__).with_name(f"claude_skills-{hostname}.talon-list")


def find_command_files(commands_dir: Path) -> list[Path]:
    """Find all .md files in the commands directory."""
    if not commands_dir.exists():
        return []
    return list(commands_dir.glob("*.md"))


def filename_to_spoken_form(filename: str) -> str:
    """Convert a filename to a spoken form.
    
    'branch-and-implement.md' -> 'branch and implement'
    'pr-review.md' -> 'pr review'
    """
    # Remove .md extension
    name = filename.rsplit('.', 1)[0]
    # Replace hyphens and underscores with spaces
    name = re.sub(r'[-_]', ' ', name)
    return name.lower()


def generate_claude_skills():
    """Scan for command files and write the talon-list file."""
    # Get commands directory from settings
    commands_dir_str = settings.get("user.claude_commands_directory")
    commands_dir = Path(os.path.expanduser(commands_dir_str))
    
    # Find all command files
    command_files = find_command_files(commands_dir)
    
    # Generate spoken forms
    spoken_forms = {}
    for cmd_file in command_files:
        spoken_form = filename_to_spoken_form(cmd_file.name)
        # Store the skill name without extension
        skill_name = cmd_file.stem
        spoken_forms[spoken_form] = skill_name
    
    # Write to file
    skills_file = get_claude_skills_file()
    hostname = actions.user.talon_get_hostname()
    
    with open(skills_file, "w") as f:
        f.write("list: user.claude_skills\n")
        f.write(f"hostname: {hostname}\n")
        f.write("-\n")
        for spoken_form, skill_name in sorted(spoken_forms.items()):
            f.write(f"{spoken_form}: {skill_name}\n")
    
    # Notify user
    app.notify(f"Generated {len(spoken_forms)} Claude skills")
    print(f"claude_skills: Generated {len(spoken_forms)} skills to {skills_file}")


def on_ready():
    """Called when Talon is ready."""
    if settings.get("user.claude_skills_auto_generate"):
        # Check if file exists - only auto-generate if it doesn't
        if not get_claude_skills_file().is_file():
            generate_claude_skills()


@mod.action_class
class Actions:
    def claude_skills_generate():
        """Regenerate the Claude skills list by scanning ~/.claude/commands/"""
        generate_claude_skills()


# Register to run on startup
app.register("ready", on_ready)
