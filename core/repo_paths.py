"""
Auto-generates a list of repository paths for voice navigation.

Scans configured directories for git repositories and creates spoken forms
based on the repo name. Handles conflicts by using more words from the name
(similar to how contacts/phones work in community talon).

The generated list is saved to repo_paths-<hostname>.talon-list
"""

import os
import re
from pathlib import Path

from talon import Module, actions, app, settings

mod = Module()

mod.list("repo_paths", desc="List of repository paths")


@mod.capture(rule="{user.repo_paths}")
def repo_paths(m) -> str:
    """Capture for repo paths list"""
    return m.repo_paths


mod.setting(
    "repo_scan_directories",
    type=str,
    default="~/repositories,~/projects,~/code",
    desc="Comma-separated list of directories to scan for git repos",
)

mod.setting(
    "repo_scan_max_depth",
    type=int,
    default=2,
    desc="Maximum depth to scan for git repos",
)

mod.setting(
    "repo_paths_auto_generate",
    type=bool,
    default=True,
    desc="Automatically generate repo paths on Talon startup",
)


def get_repo_paths_file() -> Path:
    """Get the path to the repo_paths talon-list file for this host."""
    hostname = actions.user.talon_get_hostname()
    return Path(__file__).with_name(f"repo_paths-{hostname}.talon-list")


def find_git_repos(base_dir: Path, max_depth: int) -> list[Path]:
    """Find all git repositories under base_dir up to max_depth."""
    repos = []
    
    def scan(directory: Path, depth: int):
        if depth > max_depth:
            return
        try:
            for entry in directory.iterdir():
                if entry.is_dir():
                    if entry.name == ".git":
                        repos.append(directory)
                        return  # Don't scan inside a repo
                    elif not entry.name.startswith("."):
                        scan(entry, depth + 1)
        except PermissionError:
            pass
    
    if base_dir.exists():
        scan(base_dir, 0)
    return repos


def name_to_spoken_form(name: str) -> list[str]:
    """Convert a repo name to a list of spoken words.
    
    'my-awesome-repo' -> ['my', 'awesome', 'repo']
    'MyAwesomeRepo' -> ['my', 'awesome', 'repo']  
    """
    # Replace common separators with spaces
    name = re.sub(r'[-_.]', ' ', name)
    # Split camelCase
    name = re.sub(r'([a-z])([A-Z])', r'\1 \2', name)
    # Split on spaces and lowercase
    words = [w.lower() for w in name.split() if w]
    return words


def get_candidate_words(words: list[str], min_length: int = 4) -> list[str]:
    """Get candidate words for spoken form, prioritizing first word if long enough,
    otherwise sorted by length descending.
    
    Returns words in priority order for trying as spoken forms.
    """
    if not words:
        return []
    
    # If first word is long enough, prioritize it
    if len(words[0]) >= min_length:
        # Return first word, then others sorted by length
        others = sorted(words[1:], key=len, reverse=True)
        return [words[0]] + others
    else:
        # Sort all words by length descending
        return sorted(words, key=len, reverse=True)


def generate_unique_spoken_forms(repos: list[Path]) -> dict[str, str]:
    """Generate unique spoken forms for each repo path.
    
    Strategy:
    1. Use first word if it's at least 4 characters
    2. Otherwise use the longest word
    3. If conflict, try next longest word
    4. Fall back to first word with a number
    """
    # Map repo path to its word list
    repo_words = {str(repo): name_to_spoken_form(repo.name) for repo in repos}
    
    spoken_forms = {}  # spoken_form -> path
    
    # Process each repo
    for repo_path, words in repo_words.items():
        if not words:
            continue
        
        # Get candidate words in priority order
        candidates = get_candidate_words(words)
        
        # Try each candidate until we find one that's not taken
        assigned = False
        for candidate in candidates:
            if candidate not in spoken_forms:
                spoken_forms[candidate] = repo_path
                assigned = True
                break
        
        # If all candidates are taken, use first word with a number
        if not assigned:
            base_form = words[0]
            counter = 1
            while f"{base_form} {counter}" in spoken_forms:
                counter += 1
            spoken_forms[f"{base_form} {counter}"] = repo_path
    
    return spoken_forms


def generate_repo_paths():
    """Scan for repos and write the talon-list file."""
    # Get scan directories from settings
    scan_dirs_str = settings.get("user.repo_scan_directories")
    max_depth = settings.get("user.repo_scan_max_depth")
    
    scan_dirs = [
        Path(os.path.expanduser(d.strip()))
        for d in scan_dirs_str.split(",")
        if d.strip()
    ]
    
    # Find all repos
    all_repos = []
    for scan_dir in scan_dirs:
        all_repos.extend(find_git_repos(scan_dir, max_depth))
    
    # Generate unique spoken forms
    spoken_forms = generate_unique_spoken_forms(all_repos)
    
    # Write to file
    repo_paths_file = get_repo_paths_file()
    hostname = actions.user.talon_get_hostname()
    
    with open(repo_paths_file, "w") as f:
        f.write("list: user.repo_paths\n")
        f.write(f"hostname: {hostname}\n")
        f.write("-\n")
        for spoken_form, path in sorted(spoken_forms.items(), key=lambda x: x[1]):
            f.write(f"{spoken_form}: {path}\n")
    
    # Notify user
    app.notify(f"Generated {len(spoken_forms)} repo paths")
    print(f"repo_paths: Generated {len(spoken_forms)} paths to {repo_paths_file}")


def on_ready():
    """Called when Talon is ready."""
    # Check if auto-generate is enabled
    if settings.get("user.repo_paths_auto_generate"):
        # Check if file exists - only auto-generate if it doesn't
        if not get_repo_paths_file().is_file():
            generate_repo_paths()


@mod.action_class
class Actions:
    def repo_paths_generate():
        """Regenerate the repo paths list by scanning for git repositories."""
        generate_repo_paths()


# Register to run on startup
app.register("ready", on_ready)
