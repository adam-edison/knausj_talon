# Sound test - logs parrot sounds with timestamps when sound test mode is active
# Log output: workflow/sounds_test.log (see sounds_test.py)

mode: user.sound_test
-
sounds test off:
    mode.disable("user.sound_test")
    mode.enable("command")

# Names must match pattern keys in ~/.talon/parrot/patterns.json (not raw model classes)
parrot(clop): user.sound_test_log('clop')
parrot(kuh): user.sound_test_log('kuh')
parrot(tih): user.sound_test_log('tih')
parrot(puh): user.sound_test_log('puh')
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
