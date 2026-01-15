# Migration Plan: knausj_talon → talon-community

## Status: ✅ COMPLETE

Migration completed on 2026-01-15.

## Summary of Changes

### Apps Ported
- Gmail (voice commands for archive/trash)
- Google Sheets (cell navigation, line cloning)
- Notion Calendar (with task status marking system)
- Red Hot Timer (timer management)
- Talon REPL (debugging toolkit)
- Zoom (mute toggle)
- VSCode snippets (Python & C# snippet lists)
- VSCode extras (comprehensive workflow commands)

### Core Additions
- face_test.talon (facial expression testing)
- game_mode (gaming without command conflicts)
- Chrome: emoji tag + tab clip command
- Finder: navigation actions + copy path/inside commands
- iTerm2: line navigation + follower command
- Apple Terminal: paste image + follower commands
- Brave: window switching commands
- Mouse grid: grid close command
- Dictation mode: clear end/home commands
- Edit actions: word/line variants (cut/copy/paste)
- Edit spoken forms: copier/cutter/paster/saver aliases

### Already Present (kept talon-community versions)
- VSCode command_client (better modular architecture in core/)
- engine.py, key_wait.py/talon (identical)
- edit_settings.talon (equivalent: edit_text_file.talon)
- keys.py alphabet (equivalent: letter.talon-list)
- All Windows/Linux-only apps
- All lang files, plugin files, tags

---

## Overview

Migrate valuable functionality from `~/.talon/user/knausj_talon` into this repository.

**Scope**: 68 unique files in knausj_talon, 227 files that differ

---

## Phase 1: Triage & Categorization

### Unique Apps - Full Decision Log

**apps/gmail/gmail.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/google_sheets/google_sheets.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/jira/jira.talon**

- Decision: **Skip**
- Reason: User no longer uses this product
- Dependencies: None

**apps/notion_calendar/notion_calendar.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: workflow/task_text/mark_status.py, workflow/task_text/mark_status.talon

**workflow/task_text/mark_status.py**

- Decision: **Port**
- Reason: Required dependency for notion_calendar - defines `user.task_status` list and `mark_status` action
- Dependencies: None

**workflow/task_text/mark_status.talon**

- Decision: **Port**
- Reason: Required dependency for notion_calendar - provides "mark done", "mark clear" commands
- Dependencies: mark_status.py

**apps/red_hot_timer/red_hot_timer.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/talon_repl/talon_repl.talon**

- Decision: **Port**
- Reason: Substantial debugging toolkit - test phrases, inspect actions/lists/tags/settings/scope/apps/windows
- Dependencies: None
- Test Plan: Test in REPL: "test last", "debug tags", "debug running apps"

**apps/ticktick/ticktick.talon**

- Decision: **Skip**
- Reason: User won't be using this product much longer
- Dependencies: None

**apps/todoist/todoist.talon**

- Decision: **Skip**
- Reason: User no longer using this product
- Note: Was already ported in commit bae51ec6 - may need to remove
- Dependencies: None

**apps/zoom/zoom.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/1password/chrome-extension/1password_chrome_mac.py**

- Decision: **Port**
- Reason: Password retrieval automation - useful security workflow
- Dependencies: None
- Test Plan: Test: "password" command in Chrome

**apps/1password/chrome-extension/1password_chrome_mac.talon**

- Decision: **Port**
- Reason: Voice commands for 1Password extension
- Dependencies: 1password_chrome_mac.py
- Test Plan: Test with above

**apps/slack/slack_mac_extras.py**

- Decision: **Port**
- Reason: Emoji reaction action (`slack_emoji_reaction`)
- Dependencies: None
- Test Plan: Test: "react thumbs up" in Slack

**apps/slack/slack_mac_extras.talon**

- Decision: **Port**
- Reason: Channel search, home nav, predefined reactions list
- Dependencies: slack_mac_extras.py
- Test Plan: Test: "channel [text]", "react done"

**apps/vscode/command_client/command_client.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/vscode/command_client/vscode.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: command_client.py

**apps/vscode/command_client/visual_studio.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: command_client.py

**apps/vscode/command_client/command_client_tag.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/vscode/snippets/python_snippets.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/vscode/snippets/csharp_snippets.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/vscode/vscode-extras.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/vscode/vscode-extras.mac.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**apps/vscode/vscode-extras.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

### Unique Core Files - Full Decision Log

**core/face_held.py**

- Decision: **Port**
- Reason: Well-designed facial expression timing system (123 lines) - triggers actions based on held expressions
- Dependencies: None
- Test Plan: Verify no Python errors on reload; test with facial expressions if available

**core/face_test.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: face_held.py

**core/keys/key_wait.py**

- Decision: **Port**
- Reason: Useful delay utilities - `wait_and_press()`, `wait_and_slow_press()` for slow apps
- Dependencies: None
- Test Plan: Test: "waiter", "sleeper" commands

**core/keys/key_wait.talon**

- Decision: **Port**
- Reason: Voice commands for delays (200ms, 1000ms waits)
- Dependencies: key_wait.py
- Test Plan: Test: "waiter", "sleeper"

**core/edit_settings.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**core/engine.py**

- Decision: **Port**
- Reason: Speech engine control - sleep, wake, mimic actions
- Dependencies: None
- Test Plan: Test in REPL: `actions.user.engine_sleep()`

**core/modes/game_mode.py**

- Decision: **Port**
- Reason: User decision
- Dependencies: None

**core/modes/game_mode.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: game_mode.py

**core/modes/keyboard_shortcuts/game_mode_shortcuts.talon**

- Decision: **Port**
- Reason: User decision
- Dependencies: game_mode.py

### Differing Files - Analysis Summary

**apps/slack/slack.py**

- Status: talon-community has slack_reactions list and many action declarations (open_workspace, show_channel_info, section navigation, emoji_reaction, etc.)
- Action: **Keep current**
- Reason: talon-community already incorporates slack_mac_extras additions; knausj is just basic app matching

**apps/slack/slack_mac.py**

- Status: talon-community has slack_reactions list and Mac-specific action implementations (open_workspace, formatting shortcuts, huddle, etc.)
- Action: **Keep current**
- Reason: talon-community already has extras; knausj only has basic implementation

**apps/slack/slack_win.py**

- Status: talon-community has Windows-specific action implementations (ctrl-based shortcuts)
- Action: **Keep current**
- Reason: talon-community has Windows equivalents of extras; knausj only has basic implementation

**apps/chrome/chrome.py**

- Status: Minor difference - talon-community uses raw string and case-insensitive regex for app matching
- Action: **Keep current**
- Reason: talon-community has more robust regex matching

**apps/chrome/chrome.talon**

- Status: knausj has `tag(): user.emoji` and `tab clip` command (open new tab, paste, enter)
- Action: **Port**
- Reason: Useful additions - emoji tag support and quick URL opening from clipboard

**apps/finder/finder.py**

- Status: knausj has go_forward/go_back actions; talon-community has address_focus/address_copy_address/address_navigate
- Action: **Merge**
- Reason: Both have useful, non-overlapping features

**apps/finder/finder.talon**

- Status: talon-community has address/navigation tags; knausj has `copy path` and `inside` commands
- Action: **Merge**
- Reason: Add knausj's commands while keeping talon-community's tags

**apps/iterm/iterm.py**

- Status: knausj has edit.line_start/line_end actions (home/end keys) plus commented-out file_manager code
- Action: **Port**
- Reason: line_start/line_end useful for terminal navigation; ignore commented code

**BATCH: App Regex/Matching Only (11 files)**

- apps/brave/brave.py
- apps/edge/edge.py
- apps/opera/opera.py
- apps/firefox/firefox.py
- apps/thunderbird/thunderbird.py
- apps/kindle/kindle.py
- apps/okular/okular.py
- apps/nitro_reader/nitro_reader_5.py
- apps/calibre/calibre.py
- apps/tmux/tmux.py
- apps/sumatrapdf/sumatrapdf.py
- Action: **Keep current**
- Reason: talon-community has better regex matching with `r"""` and case-insensitive patterns

**BATCH: Small App Feature Additions (5 files)**

- apps/iterm/iterm.talon - adds `follower` command (cmd+click)
- apps/apple_terminal/apple_terminal.talon - adds `paste image`, `follower` commands
- apps/brave/brave.talon - adds `window <text>` and `window <number>` for window switching
- apps/gnome_terminal/gnome_terminal.py - adds Mate-terminal support
- apps/opera/opera_win_linux.py - adds `preferences` action (alt-p)
- Action: **Port**
- Reason: Useful feature additions for each app

**BATCH: Windows-only Apps (10 files)**

- apps/conemu/conemu.talon
- apps/windows_command_processor/command_processor_actions_win.py
- apps/windows_command_processor/command_processor_win.py
- apps/windows_explorer/windows_explorer.talon
- apps/windows_explorer/windows_explorer.py
- apps/powershell/powershell_win.talon
- apps/powershell/powershell_win.py
- apps/mintty/mintty_win.py
- apps/notepad++/notepad++_win.py
- apps/wsl/wsl.py
- Action: **Keep current**
- Reason: User on Mac; use latest talon-community versions for Windows

**BATCH: Linux-only Apps (5 files)**

- apps/i3wm/i3wm.talon
- apps/i3wm/i3wm.py
- apps/nautilus/nautilus.py
- apps/kde_konsole/kde_konsole.py
- apps/eclipse/eclipse_win.py
- Action: **Keep current**
- Reason: User on Mac; use latest talon-community versions for Linux

**BATCH: Cross-platform Apps (15 files)**

- apps/vivaldi/vivaldi.py
- apps/vivaldi/vivaldi.talon
- apps/emacs/emacs.py
- apps/emacs/emacs.talon
- apps/emacs/emacs_commands.py
- apps/emacs/emacs_commands.csv
- apps/jetbrains/jetbrains.py
- apps/jetbrains/jetbrains.talon
- apps/visualstudio/visual_studio.py
- apps/visualstudio/visual_studio.talon
- apps/visualstudio/visual_studio_win.py
- apps/eclipse/eclipse.talon
- apps/adobe/adobe_acrobat_reader_dc.py
- apps/adobe/adobe_acrobat_reader_dc_win.py
- Action: **Keep current**
- Reason: talon-community has better features (command_search tags, more IDEs, cleaner code, better regex)

**BATCH: Core Files - Small Additions to Port (2 files)**

- core/mouse_grid/mouse_grid_always.talon - adds `grid close` command
- core/modes/dictation_mode.talon - adds `clear end` and `clear home` commands
- Action: **Port**
- Reason: Useful small additions from knausj

**BATCH: Core Files - Keep Current (~50 files)**

- core/app_switcher/app_name_overrides.linux.csv
- core/app_switcher/app_name_overrides.mac.csv
- core/app_switcher/app_name_overrides.windows.csv
- core/app_switcher/app_switcher.py
- core/application_matches.py
- core/create_spoken_forms.py
- core/deprecations.py
- core/edit/edit_linux.py
- core/edit/edit_mac.py
- core/edit/edit_win.py
- core/edit/insert_between.py
- core/engine.py
- core/face_held.py
- core/file_extension/file_extension.py
- core/help/help.py
- core/help/help.talon
- core/help/help_open.talon
- core/help/help_scope.py
- core/homophones/homophones.csv
- core/homophones/homophones.py
- core/homophones/homophones.talon
- core/homophones/homophones_open.talon
- core/keys/key_wait.py
- core/keys/key_wait.talon
- core/keys/keys.talon
- core/modes/dictation_mode.talon (keep current, port additions separately)
- core/modes/language_modes.py
- core/modes/language_modes.talon
- core/modes/modes.py
- core/modes/sleep_mode.talon
- core/mouse_grid/mouse_grid.py
- core/mouse_grid/mouse_grid_open.talon
- core/noise.py
- core/numbers/numbers.py
- core/numbers/ordinals.py
- core/screens/screens.py
- core/system_paths.py
- core/text/text.talon
- core/text/text_and_dictation.py
- core/user_settings.py
- core/vocabulary/edit_vocabulary.talon
- core/vocabulary/vocabulary.py
- core/websites_and_search_engines/websites_and_search_engines.py
- core/websites_and_search_engines/websites_and_search_engines.talon
- core/windows_and_tabs/tabs.py
- core/windows_and_tabs/tabs.talon
- core/windows_and_tabs/window_management.talon
- core/windows_and_tabs/window_snap.py
- core/windows_and_tabs/windows_and_tabs_linux.py
- core/windows_and_tabs/windows_and_tabs_mac.py
- core/windows_and_tabs/windows_and_tabs_win.py
- core/abbreviate/abbreviate.py
- Action: **Keep current**
- Reason: talon-community has better regex, more features, more configurability, cleaner code

**BATCH: Lang Files - Keep Current (59 files)**

- All files in lang/batch/, lang/c/, lang/csharp/, lang/css/, lang/go/, lang/java/
- lang/javascript/, lang/lua/, lang/markdown/, lang/php/, lang/proto/, lang/python/
- lang/r/, lang/ruby/, lang/rust/, lang/scala/, lang/sql/, lang/talon/
- lang/terraform/, lang/typescript/, lang/vimscript/
- All files in lang/tags/
- Action: **Keep current**
- Reason: talon-community uses modern `code.language` matching (integrates with VSCode), more modular structure

**BATCH: Plugin Files - Keep Current (27 files)**

- plugin/cancel/cancel.py, cancel.talon
- plugin/command_history/command_history.py
- plugin/desktops/desktops.py, desktops.talon
- plugin/draft_editor/draft_editor.py, draft_editor.talon
- plugin/dropdown/dropdown.talon
- plugin/eye_tracking_settings.py
- plugin/mode_indicator/mode_indicator.py, mode_indicator.talon, README.md
- plugin/mouse/mouse.py, mouse.talon, mouse_cursor.talon
- plugin/paste_to_insert.py
- plugin/screenshot/screenshot.py, screenshot.talon
- plugin/symbols/symbols.talon
- plugin/talon_draft_window/draft_talon_helpers.py, draft_ui.py, draft_window.talon, settings.talon.example
- plugin/talon_helpers/create_app_context.py, talon_helpers.py, talon_helpers.talon
- plugin/text_navigation/text_navigation.py
- Action: **Keep current**
- Reason: talon-community has modular delimiter_pair captures, cleaner dataclass structures, more debug helpers

**BATCH: Tags Files - Keep Current (18 files)**

- tags/browser/browser.py, browser.talon, browser_mac.py
- tags/emoji/emoji.py
- tags/file_manager/file_manager.py, file_manager.talon
- tags/find_and_replace/find_and_replace.py, find_and_replace.talon
- tags/line_commands/line_commands.talon
- tags/messaging/messaging.py
- tags/pages/pages.py, pages.talon
- tags/splits/splits.py
- tags/terminal/terminal.py, terminal.talon, unix_shell.py, unix_utilities.py, windows_shell.py
- Action: **Keep current**
- Reason: talon-community is more maintained

**BATCH: Misc/Root Files - Keep Current (8 files)**

- .claude/settings.local.json
- .pre-commit-config.yaml
- BREAKING_CHANGES.txt
- CONTRIBUTING.md
- README.md
- pyproject.toml
- requirements-dev.txt
- settings.talon
- Action: **Keep current**
- Reason: talon-community project files are more up-to-date

**BATCH: Test Files - Keep Current (3 files)**

- test/stubs/talon/__init__.py
- test/test_create_spoken_forms.py
- test/test_formatters.py
- Action: **Keep current**
- Reason: talon-community test infrastructure

**core/edit/edit.py**

- Status: knausj has cut/copy/paste word variants
- Action: **Port** - user decision

**core/edit/edit.talon**

- Status: knausj has richer spoken forms
- Action: **Port** - user decision

**core/keys/keys.py**

- Status: knausj has CSV-based alphabet customization
- Action: **Port** - user decision

**apps/vscode/vscode.py**

- Status: talon-community ahead
- Action: **Keep current**

**apps/vscode/vscode.talon**

- Status: talon-community ahead
- Action: **Keep current**

**core/homophones/homophones.csv**

- Status: talon-community has 19 more entries
- Action: **Keep current**

**Most other differing files**

- Status: Minor personal tweaks
- Action: **Keep talon-community versions**
