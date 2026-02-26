# Commands available while the grid is open.
# This mode disables normal voice commands so only grid sounds are active.
# To change any sound, replace the parrot name (e.g., parrot(pop) instead of parrot(tih)).
mode: user.gaze_mouse_grid
-
# "kuh" toggles grid closed (same sound as opening)
parrot(kuh): user.gaze_grid_toggle()

# "tih" narrows the grid: zooms into the cell under your cursor
parrot(tih): user.gaze_grid_narrow_at_cursor()

# "clop" clicks at the target location and closes the grid
parrot(clop): user.gaze_grid_click()
