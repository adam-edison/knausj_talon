# Migration Plan: knausj_talon → talon-community

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

---

## Phase 2: Pre-Migration Setup

1. Verify talon-community branch is current with main
2. Create feature branch for migration
3. Ensure Talon is running for interactive testing
4. Document currently-working voice commands you rely on

---

## Phase 3: Migration Execution (Iterative Batches)

**Note:** All testing deferred to Phase 4. This repo will be copied to ~/.talon/user/ for final validation.

### Batch 1: Core Utilities (Low Risk) ✓

- [x] Port `core/keys/key_wait.py` and `.talon` ✓ (commit 7c1f4815)
- [x] Port `core/engine.py` ✓ (commit c098e7d3)

### Batch 2: Facial Expression System ✓

- [x] Port `core/face_held.py` ✓ (commit ad37bc50)

### Batch 3: Edit Command Enhancements ✓

- [x] Review knausj edit.py for word-level operations ✓
  - **Finding:** talon-community already has word-level operations via compound command system
  - "cut word", "copy word", "clear word" work via `<user.edit_action> <user.edit_modifier>`
  - Difference: knausj uses `select_word()` (word under cursor), talon-community uses `extend_word_right()` (extends selection)
  - **Decision:** Keep talon-community's existing compound system - already functional

### Batch 4: Talon REPL Debugging ✓

- [x] Port `apps/talon_repl/talon_repl.talon` ✓
  - **Finding:** talon-community already has identical content at `apps/talon/talon_repl/talon_repl.talon`
  - Uses proper `app: talon_repl` context instead of raw `win.title` matchers
  - No changes needed

### Batch 5: App Integrations ✓

- [x] Port Todoist ✓ (commit bae51ec6)
- [x] Port Slack Mac extras ✓ (commit 6036e54f)
  - Added predefined reactions list ("react done", "react thumbs up", etc.)
  - Added "channel <text>" shortcut for quick channel navigation
- [x] Port 1Password Chrome extension ✓ (commit 4a283af5)

### Batch 6: VSCode Command Client (Conditional) ✓

- [x] Compare knausj `apps/vscode/command_client/` with talon-community `core/command_client/` ✓
  - **Finding:** talon-community is ahead with a more modular architecture
  - knausj: All logic in one 412-line file
  - talon-community: Clean separation with `rpc_client` submodule, supports VSCode, Visual Studio, and JetBrains
  - **Decision:** Keep talon-community's implementation - no changes needed

---

## Phase 4: Validation

**Setup:** Copy talon-community to ~/.talon/user/ and reload Talon

**Core utilities:**

- [ ] "waiter" and "sleeper" commands work
- [ ] engine_sleep/wake/mimic actions work in REPL

**Facial expressions:**

- [ ] No Python errors on reload

**Edit commands:**

- [ ] "cut word", "copy word", "clear word" work (via compound command system)

**REPL debugging:**

- [ ] "test last", "debug tags", "debug scope" work

**App integrations:**

- [ ] Todoist: "task time 30", "priority 1"
- [ ] Slack: "react thumbs up", "channel [text]"
- [ ] 1Password: "password" command in Chrome

**Cleanup:**

- [ ] Remove duplicates/conflicts
- [ ] Update imports if needed

---

## Summary: Files to Port

**Apps:**

- `apps/gmail/gmail.talon`
- `apps/google_sheets/google_sheets.talon`
- `apps/notion_calendar/notion_calendar.talon`
- `apps/red_hot_timer/red_hot_timer.talon`
- `apps/talon_repl/talon_repl.talon`
- `apps/zoom/zoom.talon`
- `apps/1password/chrome-extension/1password_chrome_mac.py`
- `apps/1password/chrome-extension/1password_chrome_mac.talon`
- `apps/slack/slack_mac_extras.py`
- `apps/slack/slack_mac_extras.talon`
- `apps/vscode/command_client/command_client.py`
- `apps/vscode/command_client/vscode.py`
- `apps/vscode/command_client/visual_studio.py`
- `apps/vscode/command_client/command_client_tag.py`
- `apps/vscode/snippets/python_snippets.py`
- `apps/vscode/snippets/csharp_snippets.py`
- `apps/vscode/vscode-extras.talon`
- `apps/vscode/vscode-extras.mac.talon`
- `apps/vscode/vscode-extras.py`

**Core:**

- `core/keys/key_wait.py`
- `core/keys/key_wait.talon`
- `core/engine.py`
- `core/face_held.py`
- `core/face_test.talon`
- `core/edit_settings.talon`
- `core/modes/game_mode.py`
- `core/modes/game_mode.talon`
- `core/modes/keyboard_shortcuts/game_mode_shortcuts.talon`

**Workflow (new):**

- `workflow/task_text/mark_status.py`
- `workflow/task_text/mark_status.talon`

**Differing files to merge:**

- `core/edit/edit.py`
- `core/edit/edit.talon`
- `core/keys/keys.py`

**Skip:**

- `apps/jira/jira.talon` - user no longer uses this product
- `apps/ticktick/ticktick.talon` - user won't be using much longer
- `apps/todoist/todoist.talon` - user no longer uses this product (remove already-ported version)
