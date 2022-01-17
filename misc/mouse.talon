(control mouse|controller|holder): user.mouse_toggle_control_mouse()
freeze: user.temporarily_toggle_control_mouse(2000)
flash: user.temporarily_toggle_control_mouse(1200)
(zoom mouse|zoomer): user.mouse_toggle_zoom_mouse()
(camera overlay|overlay): user.mouse_toggle_camera_overlay()
(run calibration|calibration): user.mouse_calibrate()

# parrot(tut): mouse_click()
parrot(cluck): mouse_click()

^touch$:
    mouse_click(0)
    # close the mouse grid if open
    user.grid_close()
    
^poke$:
    mouse_click(1)
    # close the mouse grid if open
    user.grid_close()
    
midclick:
    mouse_click(2)
    # close the mouse grid
    user.grid_close()
    
    #see keys.py for modifiers.
    #defaults
    #command
    #control
    #option = alt
    #shift
    #super = windows key
<user.modifiers> touch:
    key("{modifiers}:down")
    mouse_click(0)
    key("{modifiers}:up")
    # close the mouse grid
    user.grid_close()
<user.modifiers> menu:
    key("{modifiers}:down")
    mouse_click(1)
    key("{modifiers}:up")
    # close the mouse grid
    user.grid_close()
doubling:
    mouse_click()
    mouse_click()
    # close the mouse grid
    user.grid_close()
tripling:
    mouse_click()
    mouse_click()
    mouse_click()
    # close the mouse grid
    user.grid_close()
drag:
    user.mouse_drag()
    # close the mouse grid
    user.grid_close()
    
    # TODO: AGE: fix all these scrolling commands and test them properly
scroll down: user.mouse_scroll_down()
scroll down here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down()
scroll tiny up: mouse_scroll(20)
scroll tiny up here:
    user.mouse_move_center_active_window()
    mouse_scroll(20)
upper: user.mouse_scroll_down_continuous()
scroll upper slow: user.mouse_scroll_down_continuous("200ms")
scroll upper here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_down_continuous()
scroll down: user.mouse_scroll_up()
scroll down here:
    user.mouse_scroll_up()
scroll tiny down: mouse_scroll(-20)
scroll tiny down here:
    user.mouse_move_center_active_window()
    mouse_scroll(-20)
downer: user.mouse_scroll_up_continuous()
scroll downer slow: user.mouse_scroll_up_continuous("200ms")
scroll downer here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_up_continuous()
scroll gaze: user.mouse_gaze_scroll()
scroll gaze here:
    user.mouse_move_center_active_window()
    user.mouse_gaze_scroll()
stop: user.mouse_scroll_stop()
stop here:
    user.mouse_move_center_active_window()
    user.mouse_scroll_stop()
scroll left: mouse_scroll(0, -40)
scroll left here:
    user.mouse_move_center_active_window()
    mouse_scroll(0, -40)
scroll tiny left: mouse_scroll(0, -20)
scroll tiny left here:
    user.mouse_move_center_active_window()
    mouse_scroll(0, -20)
scroll right: mouse_scroll(0, 40)
scroll right here:
    user.mouse_move_center_active_window()
    mouse_scroll(0, 40)
scroll tiny right: mouse_scroll(0, 20)
scroll tiny right here:
    user.mouse_move_center_active_window()
    mouse_scroll(0, 20)
curse yes: user.mouse_show_cursor()
curse no: user.mouse_hide_cursor()
copy mouse (position|location): user.copy_mouse_position()
mouse apple:
    user.mouse_move(22, 15)
    mouse_click()
click screen:
    user.mouse_move(1000, 500)
    mouse_click()
    
click left screen:
    user.mouse_move(500, 500)
    mouse_click()
    
scroll top:
    mouse_scroll(4000)
    
scroll bot:
    mouse_scroll(-4000)
    
center:
    user.mouse_move_center_active_window()
