# Voice commands available when the grid is NOT open.
# To change the parrot sound, replace "kuh" with any sound your parrot model supports
# (e.g., parrot(pop), parrot(hiss), parrot(ah), etc.)

# Say "gaze grid" to open the grid
gaze grid: user.gaze_grid_activate()

# Say "gaze grid close" to close without clicking
gaze grid close: user.gaze_grid_close()

# Short "kuh" sound toggles the grid open/closed
parrot(kuh): user.gaze_grid_toggle()
