win.title: /face_expressions_test\.log/i
-

# Face expression test file - 300ms delay before firing
# Only active when viewing the log file: workflow/face_expressions_test.log
# Say "clear face log" to clear the log file

clear face log: user.face_test_clear_log()

# =============================================================================
# PSEUDO-EXPRESSIONS (high-level, combines left+right)
# =============================================================================

# blink: close both eyes briefly
face(blink:start): user.face_test_start("blink")
face(blink:stop): user.face_test_stop("blink")

# smile: raise corners of mouth (happiness)
face(smile:start): user.face_test_start("smile")
face(smile:stop): user.face_test_stop("smile")

# frown: lower corners of mouth (sadness/displeasure)
face(frown:start): user.face_test_start("frown")
face(frown:stop): user.face_test_stop("frown")

# squint: partially close both eyes (like bright light)
face(squint:start): user.face_test_start("squint")
face(squint:stop): user.face_test_stop("squint")

# dimple: pull mouth corners back toward ears (creates cheek dimples)
face(dimple:start): user.face_test_start("dimple")
face(dimple:stop): user.face_test_stop("dimple")

# open_mouth: drop jaw to open mouth
face(open_mouth:start): user.face_test_start("open_mouth")
face(open_mouth:stop): user.face_test_stop("open_mouth")

# raise_eyebrows: lift both eyebrows (surprise)
face(raise_eyebrows:start): user.face_test_start("raise_eyebrows")
face(raise_eyebrows:stop): user.face_test_stop("raise_eyebrows")

# eye_blink: same as blink - close both eyes
face(eye_blink:start): user.face_test_start("eye_blink")
face(eye_blink:stop): user.face_test_stop("eye_blink")

# pucker_lips_outwards: push lips forward like a kiss
face(pucker_lips_outwards:start): user.face_test_start("pucker_lips_outwards")
face(pucker_lips_outwards:stop): user.face_test_stop("pucker_lips_outwards")

# pucker_lips_left: push lips toward left side
face(pucker_lips_left:start): user.face_test_start("pucker_lips_left")
face(pucker_lips_left:stop): user.face_test_stop("pucker_lips_left")

# pucker_lips_right: push lips toward right side
face(pucker_lips_right:start): user.face_test_start("pucker_lips_right")
face(pucker_lips_right:stop): user.face_test_stop("pucker_lips_right")

# =============================================================================
# EYEBROWS - fine-grained control
# =============================================================================

# brow_down_left: lower/furrow left eyebrow (angry or focused)
face(brow_down_left:start): user.face_test_start("brow_down_left")
face(brow_down_left:stop): user.face_test_stop("brow_down_left")

# brow_down_right: lower/furrow right eyebrow
face(brow_down_right:start): user.face_test_start("brow_down_right")
face(brow_down_right:stop): user.face_test_stop("brow_down_right")

# brow_inner_up: raise inner ends of eyebrows (worry/concern)
face(brow_inner_up:start): user.face_test_start("brow_inner_up")
face(brow_inner_up:stop): user.face_test_stop("brow_inner_up")

# brow_outer_up_left: raise outer end of left eyebrow (skeptical)
face(brow_outer_up_left:start): user.face_test_start("brow_outer_up_left")
face(brow_outer_up_left:stop): user.face_test_stop("brow_outer_up_left")

# brow_outer_up_right: raise outer end of right eyebrow
face(brow_outer_up_right:start): user.face_test_start("brow_outer_up_right")
face(brow_outer_up_right:stop): user.face_test_stop("brow_outer_up_right")

# =============================================================================
# EYES - blink/squint/wide (NOT gaze direction)
# =============================================================================

# blink_left: close left eye (wink)
face(blink_left:start): user.face_test_start("blink_left")
face(blink_left:stop): user.face_test_stop("blink_left")

# blink_right: close right eye (wink)
face(blink_right:start): user.face_test_start("blink_right")
face(blink_right:stop): user.face_test_stop("blink_right")

# squint_left: partially close left eye
face(squint_left:start): user.face_test_start("squint_left")
face(squint_left:stop): user.face_test_stop("squint_left")

# squint_right: partially close right eye
face(squint_right:start): user.face_test_start("squint_right")
face(squint_right:stop): user.face_test_stop("squint_right")

# eye_wide_left: open left eye wider than normal (surprise)
face(eye_wide_left:start): user.face_test_start("eye_wide_left")
face(eye_wide_left:stop): user.face_test_stop("eye_wide_left")

# eye_wide_right: open right eye wider than normal
face(eye_wide_right:start): user.face_test_start("eye_wide_right")
face(eye_wide_right:stop): user.face_test_stop("eye_wide_right")

# =============================================================================
# JAW
# =============================================================================

# jaw_open: drop jaw to open mouth wide
face(jaw_open:start): user.face_test_start("jaw_open")
face(jaw_open:stop): user.face_test_stop("jaw_open")

# jaw_left: shift jaw to the left
face(jaw_left:start): user.face_test_start("jaw_left")
face(jaw_left:stop): user.face_test_stop("jaw_left")

# jaw_right: shift jaw to the right
face(jaw_right:start): user.face_test_start("jaw_right")
face(jaw_right:stop): user.face_test_stop("jaw_right")

# =============================================================================
# MOUTH - general shapes
# =============================================================================

# mouth_close: press lips firmly together
face(mouth_close:start): user.face_test_start("mouth_close")
face(mouth_close:stop): user.face_test_stop("mouth_close")

# mouth_funnel: make "O" shape with lips (like saying "oo")
face(mouth_funnel:start): user.face_test_start("mouth_funnel")
face(mouth_funnel:stop): user.face_test_stop("mouth_funnel")

# mouth_pucker: pucker lips tightly (kissing face)
face(mouth_pucker:start): user.face_test_start("mouth_pucker")
face(mouth_pucker:stop): user.face_test_stop("mouth_pucker")

# mouth_left: shift whole mouth toward left
face(mouth_left:start): user.face_test_start("mouth_left")
face(mouth_left:stop): user.face_test_stop("mouth_left")

# mouth_right: shift whole mouth toward right
face(mouth_right:start): user.face_test_start("mouth_right")
face(mouth_right:stop): user.face_test_stop("mouth_right")

# =============================================================================
# MOUTH - lower lip movements
# =============================================================================

# mouth_lower_down_left: pull lower lip down on left (showing lower teeth)
face(mouth_lower_down_left:start): user.face_test_start("mouth_lower_down_left")
face(mouth_lower_down_left:stop): user.face_test_stop("mouth_lower_down_left")

# mouth_lower_down_right: pull lower lip down on right
face(mouth_lower_down_right:start): user.face_test_start("mouth_lower_down_right")
face(mouth_lower_down_right:stop): user.face_test_stop("mouth_lower_down_right")

# =============================================================================
# MOUTH - press (lips pressed together tightly)
# =============================================================================

# mouth_press_left: press lips together tightly on left side
face(mouth_press_left:start): user.face_test_start("mouth_press_left")
face(mouth_press_left:stop): user.face_test_stop("mouth_press_left")

# mouth_press_right: press lips together tightly on right side
face(mouth_press_right:start): user.face_test_start("mouth_press_right")
face(mouth_press_right:stop): user.face_test_stop("mouth_press_right")

# =============================================================================
# MOUTH - roll (rolling lip inward, tucking it in)
# =============================================================================

# mouth_roll_lower: roll lower lip inward (tuck under teeth)
face(mouth_roll_lower:start): user.face_test_start("mouth_roll_lower")
face(mouth_roll_lower:stop): user.face_test_stop("mouth_roll_lower")

# mouth_roll_upper: roll upper lip inward
face(mouth_roll_upper:start): user.face_test_start("mouth_roll_upper")
face(mouth_roll_upper:stop): user.face_test_stop("mouth_roll_upper")

# =============================================================================
# MOUTH - shrug (raising lip like uncertainty "meh")
# =============================================================================

# mouth_shrug_lower: raise lower lip upward (pouting, "meh")
face(mouth_shrug_lower:start): user.face_test_start("mouth_shrug_lower")
face(mouth_shrug_lower:stop): user.face_test_stop("mouth_shrug_lower")

# mouth_shrug_upper: raise upper lip (mild disgust)
face(mouth_shrug_upper:start): user.face_test_start("mouth_shrug_upper")
face(mouth_shrug_upper:stop): user.face_test_stop("mouth_shrug_upper")

# =============================================================================
# MOUTH - smile (per-side)
# =============================================================================

# smile_left: raise left corner of mouth
face(smile_left:start): user.face_test_start("smile_left")
face(smile_left:stop): user.face_test_stop("smile_left")

# smile_right: raise right corner of mouth
face(smile_right:start): user.face_test_start("smile_right")
face(smile_right:stop): user.face_test_stop("smile_right")

# =============================================================================
# MOUTH - stretch (pulling corner outward, like grimace)
# =============================================================================

# mouth_stretch_left: stretch left corner of mouth outward (grimace)
face(mouth_stretch_left:start): user.face_test_start("mouth_stretch_left")
face(mouth_stretch_left:stop): user.face_test_stop("mouth_stretch_left")

# mouth_stretch_right: stretch right corner outward
face(mouth_stretch_right:start): user.face_test_start("mouth_stretch_right")
face(mouth_stretch_right:stop): user.face_test_stop("mouth_stretch_right")

# =============================================================================
# MOUTH - upper lip movements
# =============================================================================

# mouth_upper_up_left: raise upper lip on left (snarl, showing upper teeth)
face(mouth_upper_up_left:start): user.face_test_start("mouth_upper_up_left")
face(mouth_upper_up_left:stop): user.face_test_stop("mouth_upper_up_left")

# mouth_upper_up_right: raise upper lip on right
face(mouth_upper_up_right:start): user.face_test_start("mouth_upper_up_right")
face(mouth_upper_up_right:stop): user.face_test_stop("mouth_upper_up_right")

# =============================================================================
# DIMPLES (per-side) - pulling mouth corners back
# =============================================================================

# dimple_left: pull left mouth corner back toward ear
face(dimple_left:start): user.face_test_start("dimple_left")
face(dimple_left:stop): user.face_test_stop("dimple_left")

# dimple_right: pull right mouth corner back toward ear
face(dimple_right:start): user.face_test_start("dimple_right")
face(dimple_right:stop): user.face_test_stop("dimple_right")

# =============================================================================
# FROWN (per-side) - lowering mouth corners
# =============================================================================

# frown_left: lower left corner of mouth (sadness)
face(frown_left:start): user.face_test_start("frown_left")
face(frown_left:stop): user.face_test_stop("frown_left")

# frown_right: lower right corner of mouth
face(frown_right:start): user.face_test_start("frown_right")
face(frown_right:stop): user.face_test_stop("frown_right")
