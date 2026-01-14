# Migration Plan: knausj_talon → talon-community

## Overview

Migrate valuable functionality from `~/.talon/user/knausj_talon` into this repository.

**Scope**: 68 unique files in knausj_talon, 227 files that differ

---

## Phase 1: Triage & Categorization

### Unique Apps - Full Decision Log

| File/Directory | Decision | Reason | Dependencies | Test Plan |
|----------------|----------|--------|--------------|-----------|
| `apps/gmail/gmail.talon` | **Skip** | Only 2 commands (trash, archive) - minimal value | None | N/A |
| `apps/google_sheets/google_sheets.talon` | **Skip** | Only 2 commands (clone line, go cell) - minimal value | None | N/A |
| `apps/jira/jira.talon` | **Skip** | Single company-specific command for `/expand` | None | N/A |
| `apps/notion_calendar/notion_calendar.talon` | **Skip** | Requires undefined `user.task_status` list - broken without external deps | External status lists | N/A |
| `apps/red_hot_timer/red_hot_timer.talon` | **Skip** | Mac-specific timer app, low general value | None | N/A |
| `apps/talon_repl/talon_repl.talon` | **Port** | Substantial debugging toolkit - test phrases, inspect actions/lists/tags/settings/scope/apps/windows | None | Test in REPL: "test last", "debug tags", "debug running apps" |
| `apps/ticktick/ticktick.talon` | **Skip** | Uses hardcoded mouse coordinates (fragile automation) | None | N/A |
| `apps/todoist/todoist.talon` | **Port** | Comprehensive task commands - time estimates, priorities, labels, projects, search | None | Test in Todoist: "task time 30", "priority 1", "hunt [word]" |
| `apps/zoom/zoom.talon` | **Skip** | Single command only ("zoom sleep") | None | N/A |
| `apps/1password/chrome-extension/1password_chrome_mac.py` | **Port** | Password retrieval automation - useful security workflow | None | Test: "password" command in Chrome |
| `apps/1password/chrome-extension/1password_chrome_mac.talon` | **Port** | Voice commands for 1Password extension | 1password_chrome_mac.py | Test with above |
| `apps/slack/slack_mac_extras.py` | **Port** | Emoji reaction action (`slack_emoji_reaction`) | None | Test: "react thumbs up" in Slack |
| `apps/slack/slack_mac_extras.talon` | **Port** | Channel search, home nav, predefined reactions list | slack_mac_extras.py | Test: "channel [text]", "react done" |
| `apps/vscode/command_client/command_client.py` | **Review** | Sophisticated RPC framework - check if `core/command_client/` in talon-community is equivalent | None | Compare implementations first |
| `apps/vscode/command_client/vscode.py` | **Review** | VSCode-specific RPC wrapper | command_client.py | Compare with talon-community |
| `apps/vscode/command_client/visual_studio.py` | **Review** | Visual Studio RPC support | command_client.py | Compare with talon-community |
| `apps/vscode/command_client/command_client_tag.py` | **Review** | Tag definition for command_client | None | Compare with talon-community |
| `apps/vscode/snippets/python_snippets.py` | **Skip** | Personal snippet mappings, mostly commented out | None | N/A |
| `apps/vscode/snippets/csharp_snippets.py` | **Skip** | Personal snippet mappings, mostly commented out | None | N/A |
| `apps/vscode/vscode-extras.talon` | **Skip** | Highly personal - hardcoded project names, pnpm filters | None | N/A |
| `apps/vscode/vscode-extras.mac.talon` | **Skip** | Personal Mac shortcuts | None | N/A |
| `apps/vscode/vscode-extras.py` | **Skip** | Hardcoded pnpm workspace filters for specific projects | None | N/A |

### Unique Core Files - Full Decision Log

| File | Decision | Reason | Dependencies | Test Plan |
|------|----------|--------|--------------|-----------|
| `core/face_held.py` | **Port** | Well-designed facial expression timing system (123 lines) - triggers actions based on held expressions | None | Verify no Python errors on reload; test with facial expressions if available |
| `core/face_test.talon` | **Skip** | Debug file only - marked "Remove after testing" | face_held.py | N/A |
| `core/keys/key_wait.py` | **Port** | Useful delay utilities - `wait_and_press()`, `wait_and_slow_press()` for slow apps | None | Test: "waiter", "sleeper" commands |
| `core/keys/key_wait.talon` | **Port** | Voice commands for delays (200ms, 1000ms waits) | key_wait.py | Test: "waiter", "sleeper" |
| `core/edit_settings.talon` | **Skip** | Personal workflow - opens specific settings CSV | None | N/A |
| `core/engine.py` | **Port** | Speech engine control - sleep, wake, mimic actions | None | Test in REPL: `actions.user.engine_sleep()` |
| `core/game_mode.py` | **Skip** | Files don't exist in knausj_talon | N/A | N/A |
| `core/game_mode.talon` | **Skip** | Files don't exist in knausj_talon | N/A | N/A |

### Differing Files - Analysis Summary

| Area | Status | Action |
|------|--------|--------|
| `core/edit/edit.py` | knausj has cut/copy/paste word variants | **Consider backporting** word-level operations |
| `core/edit/edit.talon` | knausj has richer spoken forms | **Consider backporting** "cut word", "copy word", etc. |
| `core/keys/keys.py` | knausj has CSV-based alphabet customization | **Optional** - nice flexibility but adds complexity |
| `apps/vscode/vscode.py` | talon-community ahead | **Keep current** |
| `apps/vscode/vscode.talon` | talon-community ahead | **Keep current** |
| `core/homophones/homophones.csv` | talon-community has 19 more entries | **Keep current** |
| Most other differing files | Minor personal tweaks | **Keep talon-community versions** |

---

## Phase 2: Pre-Migration Setup

1. Verify talon-community branch is current with main
2. Create feature branch for migration
3. Ensure Talon is running for interactive testing
4. Document currently-working voice commands you rely on

---

## Phase 3: Migration Execution (Iterative Batches)

### Batch 1: Core Utilities (Low Risk)
- Port `core/keys/key_wait.py` and `.talon`
- Port `core/engine.py`
- Test: "waiter", "sleeper", engine actions in REPL

### Batch 2: Facial Expression System
- Port `core/face_held.py`
- Test: Reload Talon, verify no errors

### Batch 3: Edit Command Enhancements
- Review knausj edit.py for word-level operations
- Selectively add to talon-community edit.py
- Add spoken forms to edit.talon
- Test: "cut word", "copy word", "paste word"

### Batch 4: Talon REPL Debugging
- Port `apps/talon_repl/talon_repl.talon`
- Test: "test last", "debug tags", "debug scope"

### Batch 5: App Integrations
- Port Todoist (test in Todoist app)
- Port Slack Mac extras (test emoji reactions)
- Port 1Password Chrome extension (test password retrieval)

### Batch 6: VSCode Command Client (Conditional)
- Compare knausj `apps/vscode/command_client/` with talon-community `core/command_client/`
- Port only if functionality differs
- Test: VSCode command execution

---

## Phase 4: Validation

1. Full Talon reload
2. Test core editing commands
3. Test navigation commands
4. Test each ported app integration
5. Remove duplicates/conflicts
6. Update imports if needed

---

## Summary: Files to Port

**Definitely Port** (10 files):
- `core/keys/key_wait.py`
- `core/keys/key_wait.talon`
- `core/engine.py`
- `core/face_held.py`
- `apps/talon_repl/talon_repl.talon`
- `apps/todoist/todoist.talon`
- `apps/slack/slack_mac_extras.py`
- `apps/slack/slack_mac_extras.talon`
- `apps/1password/chrome-extension/1password_chrome_mac.py`
- `apps/1password/chrome-extension/1password_chrome_mac.talon`

**Review First** (4 files):
- `apps/vscode/command_client/*` - compare with existing core/command_client

**Consider Backporting** (2 areas):
- Word-level operations from `core/edit/edit.py`
- Corresponding commands from `core/edit/edit.talon`

**Skip** (54+ files):
- All minimal app shortcuts
- Personal vscode-extras files
- Hardcoded automation
- Debug/test files
