# Sound test mode toggle
# Say "sounds test on" to enable, "sounds test off" to disable

# Troubleshooting Notes
# if parrot is not working, try:
# 1. check that the model.pkl file is in the ~/.talon/parrot directory
# 2. check that the patterns.json file is in the ~/.talon/parrot directory
# 3. check that the parrot_integration.py file is in the ~/.talon/user directory
# 4. check that the microphone is working (use audacity to record and play back)
# 5. check that the microphone mode is not "voice isolation" - that literally filters what we need to hear
# 6. check that the correctmicrophone is selected in talon settings

mode: command
-
sounds test on:
    mode.disable("command")
    mode.enable("user.sound_test")
    user.sound_test_clear_log()

sounds log clear: user.sound_test_clear_log()
