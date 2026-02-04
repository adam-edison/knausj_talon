# Sound test - logs parrot sounds with timestamps (always active)
# Log output: workflow/sounds_test.log (see sounds_test.py)
# Say "clear sound log" to clear the log file


# Troubleshooting Notes
# if parrot is not working, try:
# 1. check that the model.pkl file is in the ~/.talon/parrot directory
# 2. check that the patterns.json file is in the ~/.talon/parrot directory
# 3. check that the parrot_integration.py file is in the ~/.talon/user directory
# 4. check that the microphone is working (use audacity to record and play back)
# 5. check that the microphone mode is not "voice isolation" - that literally filters what we need to hear
# 6. check that the correctmicrophone is selected in talon settings

sounds log clear: user.sound_test_clear_log()

# Names must match pattern keys in ~/.talon/parrot/patterns.json (not raw model classes)
parrot(clop): user.sound_test_log('clop')
parrot(kuh): user.sound_test_log('kuh')
parrot(motor): user.sound_test_log('motor')
parrot(motor:repeat): user.sound_test_log('motor:repeat')
parrot(motor:stop): user.sound_test_log('motor:stop')
parrot(shh): user.sound_test_log('shh')
parrot(shh:repeat): user.sound_test_log('shh:repeat')
parrot(shh:stop): user.sound_test_log('shh:stop')
parrot(spit): user.sound_test_log('spit')
parrot(sss): user.sound_test_log('sss')
parrot(sss:repeat): user.sound_test_log('sss:repeat')
parrot(sss:stop): user.sound_test_log('sss:stop')
parrot(whistle_high): user.sound_test_log('whistle_high')
parrot(whistle_high:repeat): user.sound_test_log('whistle_high:repeat')
parrot(whistle_high:stop): user.sound_test_log('whistle_high:stop')
parrot(whistle_low): user.sound_test_log('whistle_low')
parrot(whistle_low:repeat): user.sound_test_log('whistle_low:repeat')
parrot(whistle_low:stop): user.sound_test_log('whistle_low:stop')
