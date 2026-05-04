# Baldur's Gate 3 Voice Control — Tutorial

A Talon control scheme for BG3 on macOS, optimized to keep your hands off the
keyboard and mouse for as long as possible. Tiers below are ordered by
**ergonomic cost**: noises first (no jaw movement, sustainable), then short
voice, then full commands.

The file is window-scoped to `Baldur's Gate 3` only — none of these commands
fire when BG3 isn't the focused window.

---

## Tier 1 — Noises (lowest effort, use these the most)

These are the BG3-specific noise overrides. Two flavors of binding:

- **Discrete noise → discrete action**: the action fires once when the
  noise is detected (e.g. `puh` → space).
- **Continuous noise → discrete action via `:stop`**: the action fires once
  when you *finish* the sustained noise (e.g. `whistle:stop` → tactical
  camera). Useful when you want a one-shot but with a longer "tell."
- **Continuous noise → continuous action (no `:stop`)**: the action
  re-fires each detection cycle while you sustain the noise (e.g. `motor`
  → Q ratchets the camera left as long as you hum).

### Combat & interaction

- **clop** *(global)* — left click. Move or interact. **This is your main
  input** — practice clopping at things you want to walk to or click on.
- **wince** — right-click. Opens the context menu.
- **puh** *(quick puff)* — `space`. End turn in combat / "take all" while
  looting / confirm prompt.
- **cha** — `tab`. Toggle combat / open party overview.
- **spit** — `esc`. Cancel current action / close menu / back out.
- **kuh** — `z`. Jump.
- **tih** *(global)* — `enter`. Confirm a dialog.

### Camera

- **motor** *(continuous brrrrr)* — **rotate camera left**, ratchets one
  notch per detection cycle while you sustain the sound.
- **snore** *(continuous)* — **rotate camera right**, same behavior.
- **sss** *(global, continuous)* — zoom in (scroll-up start/stop).
- **shh** *(global, continuous)* — zoom out (scroll-down start/stop).
- **whistle:stop** — toggle **tactical camera** (top-down). Fires once when
  you finish whistling, so a longer whistle = unambiguous trigger.

> **Tip:** for fast battlefield orientation, `whistle` (release) for
> tactical view, then `motor` / `snore` to spin the camera, then `whistle`
> again to drop back to normal.

---

## Tier 2 — Short voice commands (one or two syllables)

When a noise won't do, these are the next-cheapest. Use during exploration
and combat.

- **`click`** — left click (alias for `clop`).
- **`jump it`** — Z (alias for `kuh`).
- **`shove it`** — V.
- **`throw it`** — X.
- **`search it`** — `` ` `` (highlight all NPCs/threats).
- **`tactical`** — O (alias for `whistle`).
- **`center cam`** — Home (snap camera to active character).
- **`take all`** — space while looting.
- **`confirm`** — space.
- **`cancel`** — esc.

### Hotbar slots — `slot one` … `slot twelve`

Your action bar slots 1-9, 0, -, =. Use these constantly:

- `slot one`, `slot two`, … `slot nine` → keys 1-9
- `slot ten` → 0
- `slot eleven` → `-`
- `slot twelve` → `=`
- `hotbar next` / `hotbar last` → R / F (cycle bar pages)
- `toggle bar` → X (collapse/expand action bar)

### Dialogue choices — `speak one` … `speak nine`

In a dialogue, pick option N with `speak <number>` (uses the same number
keys as hotbar; the prefix keeps your phrasing unambiguous).

### Character switching

- `char one` … `char four` → F1-F4.
- `next char` / `last char` → `]` / `[`.

---

## Tier 3 — Multi-word commands (use less often)

### Combat

- `end turn`, `turn based`, `flee combat`, `toggle combat`
- `sneak mode` (toggle stealth on selected character)
- `weapon swap`, `sheath`, `unsheath`, `dual wield`

### Party

- `split party` *(or `ungroup`)* — chain mode off.
- `regroup` — chain back together.
- `hide party` — Shift+C.
- `party view` — Tab.

### UI panels

- `inventory`, `character sheet`, `journal`, `spell book`, `map view`
- `alchemy`, `illithid`, `inspiration`, `reactions`
- `ui hide` (F10), `game menu` *(or just `menu`)*, `cancel`

### Save / load

- `quick save` (F5)
- `quick load` (F8)

### Camera (voice fallback for non-rotation)

- `tactical`, `center cam`, `zoom in`, `zoom out`
- `rotate left`, `rotate right` (one-tap; for held rotation use `motor` /
  `snore`)

### Movement (one-tap; mouse-click-to-move is usually faster)

- `go forward`, `go back`, `go left`, `go right`

---

## Tier 4 — Modifier holds & combos

Some BG3 actions need a modifier held while clicking. These come in two
flavors:

### One-shot combos (do the whole thing)

- **`attack here`** — holds Ctrl, left-clicks where the cursor is, releases.
  This is BG3's force-attack on the targeted square/creature.
- **`ping here`** — holds Alt, right-clicks. Drops a ping for party.

### Manual hold/release (when you need finer control)

- `attack on` / `attack off` — Ctrl down / up.
- `highlight on` / `highlight off` — Alt down / up (reveal interactables).
- `sneak peek on` / `sneak peek off` — Shift down / up (preview sneak
  cones).

> **Important:** if you say `…on` you must say `…off` — otherwise the key
> stays stuck. If you forget, `cancel` (esc) won't release it; press the
> physical key once to clear it.

---

## A typical play loop, voice-only

A representative fight in BG3:

1. **`whistle`** *(then release)* — top-down view.
2. **`motor`** *(sustained)* — rotate to find the enemies.
3. **`clop`** at the ground — walk a character to position.
4. **`slot two`** — pick a spell.
5. **`clop`** at the target — fire it.
6. **`puh`** — end turn.
7. **`char two`** — next character.
8. Repeat 4-6.
9. After combat: **`spit`** to close any panels, **`quick save`**.

In dialogue:

1. **`speak two`** — pick the second option.
2. **`puh`** — advance.
3. **`spit`** when done.

---

## Troubleshooting

- **A command isn't firing.** Check the title bar matches `Baldur's Gate 3`
  — the file is window-scoped and won't activate otherwise.
- **A noise misfires often.** Tune `~/.talon/parrot/patterns.json`
  thresholds for that noise (raise `>probability` or `>power`).
- **Number key fired in dialogue when you meant a hotbar slot (or vice
  versa).** Use the prefix: `speak <n>` for dialogue, `slot <n>` for
  hotbar. Both fire the same key — the prefix is just for your own clarity.
- **Modifier got stuck after `attack on`.** Tap the physical Ctrl key once
  to clear. Always pair `…on` with `…off`.
- **Want a new noise?** Record it into `patterns.json` (see Talon's parrot
  docs). The 12 you have today are all bound — anything new is headroom for
  more BG3 actions.

---

## File layout

- `baldurs_gate_3.talon` — the command set. Edit to taste.
- `README.md` — this tutorial.

If you change BG3's in-game keybindings from the defaults, update the
matching `key(...)` calls in `baldurs_gate_3.talon` to keep them in sync.
