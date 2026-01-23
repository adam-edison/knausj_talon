win.title: /sounds_test\.log/i
-

# Sound test file - logs parrot sounds with timestamps
# Only active when viewing the log file: workflow/sounds_test.log
# Say "clear sound log" to clear the log file

clear sound log: user.sound_test_clear_log()

parrot(pew): user.sound_test_log('pew')
parrot(pew:repeat): user.sound_test_log('pew:repeat')
parrot(pew:stop): user.sound_test_log('pew:stop')
parrot(spit): user.sound_test_log('spit')
parrot(fft): user.sound_test_log('fft')
parrot(ffk): user.sound_test_log('ffk')
parrot(hawk): user.sound_test_log('hawk')
parrot(hawk:repeat): user.sound_test_log('hawk:repeat')
parrot(hawk:stop): user.sound_test_log('hawk:stop')
parrot(horse): user.sound_test_log('horse')
parrot(horse:repeat): user.sound_test_log('horse:repeat')
parrot(kiss): user.sound_test_log('kiss')
parrot(motor): user.sound_test_log('motor')
parrot(motor:repeat): user.sound_test_log('motor:repeat')
parrot(shh): user.sound_test_log('shh')
parrot(shh:repeat): user.sound_test_log('shh:repeat')
parrot(shh:stop): user.sound_test_log('shh:stop')
parrot(sss): user.sound_test_log('sss')
parrot(sss:repeat): user.sound_test_log('sss:repeat')
parrot(sss:stop): user.sound_test_log('sss:stop')
parrot(tsk): user.sound_test_log('tsk')
parrot(whistle_high): user.sound_test_log('whistle_high')
parrot(whistle_high:repeat): user.sound_test_log('whistle_high:repeat')
parrot(whistle_high:stop): user.sound_test_log('whistle_high:stop')
parrot(whistle_medium): user.sound_test_log('whistle_medium')
parrot(whistle_medium:repeat): user.sound_test_log('whistle_medium:repeat')
parrot(whistle_medium:stop): user.sound_test_log('whistle_medium:stop')
parrot(whistle_low): user.sound_test_log('whistle_low')
parrot(whistle_low:repeat): user.sound_test_log('whistle_low:repeat')
parrot(whistle_low:stop): user.sound_test_log('whistle_low:stop')
