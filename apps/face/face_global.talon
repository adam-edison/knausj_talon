os: mac
mode: user.gaming
-

face(raise_eyebrows): 
    mouse_click(1)

face(smile):
    mouse_click(0)
    sleep(10ms)
    mouse_click(0)

face(pucker_lips_outwards):
    mouse_click(0)

# Then bind any supported expressions (not just the right click expression) in a .talon file. For example, `face(smile): ...` or `face(smile:end): ...` - just like hotkeys and voice commands. 
# These expressions are supported on macOS Catalina:
# smile
# open_mouth
# stick_out_tongue
# raise_eyebrows
# These additional expressions are supported on macOS Big Sur:

# eye_blink
# scrunch_nose
# pucker_lips_outwards
# pucker_lips_left
# pucker_lips_right