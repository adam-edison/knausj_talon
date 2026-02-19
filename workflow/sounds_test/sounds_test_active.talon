# Sound test - logs parrot sounds with timestamps when sound test mode is active
# Log output: sounds_test.log (see sounds_test.py in this folder)

mode: user.sound_test
-
sounds test off:
    mode.disable("user.sound_test")
    mode.enable("command")
    app.notify("Sound test mode OFF")

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
parrot(whistle): user.sound_test_log('whistle')
parrot(whistle:repeat): user.sound_test_log('whistle:repeat')
parrot(whistle:stop): user.sound_test_log('whistle:stop')
