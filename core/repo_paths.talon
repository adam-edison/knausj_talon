settings():
    # Directories to scan for git repos (comma-separated)
    user.repo_scan_directories = "~/repositories,~/projects,~/code"
    # Maximum depth to scan
    user.repo_scan_max_depth = 2
    # Auto-generate on startup (only if file doesn't exist)
    user.repo_paths_auto_generate = true

# Command to regenerate repo paths
repo paths generate: user.repo_paths_generate()
