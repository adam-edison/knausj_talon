# Default settings for gaze mouse grid.
# To override, create your own .talon file with a more specific context
# (e.g., matching your OS) and a settings(): block with your values.
settings():
    # Number of grid subdivisions (NxN). Higher = more precision per narrow,
    # but smaller cells are harder to target with gaze.
    user.gaze_grid_size = 6

    # How much the initial gaze-based narrow zooms in.
    # 2 = start with half the screen; 3 = start with a third, etc.
    user.gaze_grid_initial_narrow_factor = 2

    # Delay after enabling control1 (head-snap) before reading cursor position.
    # Increase if your eye tracker needs more time to settle.
    user.gaze_grid_settle_delay = "200ms"

    # Grid line color in RRGGBBAA hex format.
    user.gaze_grid_line_color = "ff0000ff"

    # Hint highlight color in RRGGBBAA hex format.
    # The highlight shows which cell your gaze landed in.
    user.gaze_grid_hint_color = "ff000044"

    # Grid line stroke width in pixels.
    user.gaze_grid_line_width = 1

    # Fraction of screen used for the drawn grid.
    # 0.5 = grid occupies half the screen width/height.
    user.gaze_grid_display_ratio = 0.5
