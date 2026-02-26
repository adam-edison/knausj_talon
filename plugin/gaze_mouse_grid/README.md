# Gaze Mouse Grid

A gaze-based mouse targeting tool for [Talon](https://talonvoice.com/) that uses eye tracking and parrot sounds to quickly navigate and click anywhere on screen.

## Installation

```
cd ~/.talon/user
git clone https://github.com/aedison/gaze-mouse-grid.git
```

## Requirements

- [Talon](https://talonvoice.com/) with an eye tracker
- Eye tracking **"Always on"** must be enabled in Talon's eye tracking preferences (the grid needs continuous gaze data even when eye tracking mouse control is off)
- A parrot model with at least 3 sounds (defaults use `kuh`, `tih`, and `clop` — all sounds are customizable)

## How it works

1. Say **"gaze grid"** (or make the `kuh` sound) — the grid reads your gaze position, narrows to that region, takes a screenshot, and displays it as a zoomed-in grid overlay
2. Look at the cell containing your target, then make the **`tih`** sound — the grid narrows further into that cell and re-captures the screenshot
3. Repeat step 2 until your target is easy to hit
4. Make the **`clop`** sound — the grid closes, moves the mouse to the corresponding real-screen position, and clicks

You can close the grid without clicking by saying **"gaze grid close"** or making the `kuh` sound again.

## Command reference

### Voice commands (always available)

- **gaze grid** — open the grid
- **gaze grid close** — close the grid without clicking

### Parrot sounds (always available)

- **kuh** — toggle grid open/closed

### Parrot sounds (while grid is open)

- **tih** — narrow into the cell under your cursor
- **clop** — click at the target location and close the grid

## Configuration

All settings have sensible defaults. Override any setting by creating a `.talon` file with a `settings():` block. See `gaze_mouse_grid_settings.talon` for the full list with explanations.

- **`user.gaze_grid_size`** (int, default `6`) — grid subdivision count (NxN cells)
- **`user.gaze_grid_initial_narrow_factor`** (int, default `2`) — how much the initial gaze-based narrow zooms in
- **`user.gaze_grid_settle_delay`** (str, default `"200ms"`) — delay for eye tracker to update cursor position
- **`user.gaze_grid_line_color`** (str, default `"ff0000ff"`) — grid line color in RRGGBBAA hex
- **`user.gaze_grid_hint_color`** (str, default `"ff000044"`) — hint highlight color in RRGGBBAA hex
- **`user.gaze_grid_line_width`** (int, default `1`) — grid line stroke width in pixels
- **`user.gaze_grid_display_ratio`** (float, default `0.5`) — fraction of screen used for the drawn grid

### Customizing sounds

To use different parrot sounds, edit the `.talon` files and replace the sound names. For example, to use `pop` instead of `kuh` for toggling:

```talon
# in gaze_mouse_grid.talon
parrot(pop): user.gaze_grid_toggle()
```

Any sound your parrot model recognizes can be used.

## Known limitations

- **Talon menu dropdown** — the grid cannot target items inside the Talon menu bar dropdown. macOS renders it at a special overlay window level that the screenshot capture API cannot include. Close the grid and interact with the Talon menu normally.

## Troubleshooting

- **Grid opens but cursor isn't near your target** — increase `user.gaze_grid_settle_delay` (e.g., `"400ms"`) to give your eye tracker more time to update
- **Grid cells are too small/large** — adjust `user.gaze_grid_size` (lower = fewer, larger cells; higher = more, smaller cells)
- **Grid overlay is too small/large on screen** — adjust `user.gaze_grid_display_ratio` (0.3 = 30% of screen, 0.7 = 70%)
- **Initial zoom is too tight/loose** — adjust `user.gaze_grid_initial_narrow_factor` (1 = no initial zoom, 3 = one-third of screen)
