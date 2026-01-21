mode: user.game
win.title: /coromon/i
app.name: /coromon/i
-
settings():
    user.parrot_config_combo_window = 1000

# =============================================================================
# VOICE CONTROLS
# =============================================================================

up [<number_small>]:
    n = number_small or 1
    key("up:{n}")
down [<number_small>]:
    n = number_small or 1
    key("down:{n}")
left [<number_small>]:
    n = number_small or 1
    key("left:{n}")
right [<number_small>]:
    n = number_small or 1
    key("right:{n}")



# =============================================================================
# NOISE CONTROLS (via parrot_config for combos)
# =============================================================================

parrot(kuh): user.parrot_config_noise("kuh")
parrot(clop): user.parrot_config_noise("clop")
parrot(spit): user.parrot_config_noise("spit")

# =============================================================================
# FACE CONTROLS
# =============================================================================

# smile -> select
face(smile:start): user.face_held_start("smile", 300)
face(smile:stop): user.face_held_action("smile", "coromon_select")

# eyebrows -> select
face(raise_eyebrows:start): user.face_held_start("raise_eyebrows", 300)
face(raise_eyebrows:stop): user.face_held_action("raise_eyebrows", "coromon_select")

# pucker -> interact
face(pucker_lips_outwards:start): user.face_held_start("pucker_lips_outwards", 200)
face(pucker_lips_outwards:stop): user.face_held_action("pucker_lips_outwards", "coromon_interact")

# eye blink -> down
face(eye_blink:start): user.face_held_start("eye_blink", 300)
face(eye_blink:stop): user.face_held_action("eye_blink", "coromon_down")
