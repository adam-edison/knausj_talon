win.title: /sounds_test\.log/i
-

# Sound test file - logs parrot sounds with timestamps
# Only active when viewing the log file: workflow/sounds_test.log
# Say "clear sound log" to clear the log file

clear sound log: user.sound_test_clear_log()

# Sounds match ~/.talon/parrot/patterns.json
parrot(clop): user.sound_test_log('clop')
parrot(kuh): user.sound_test_log('kuh')
parrot(motor): user.sound_test_log('motor')
parrot(motor:repeat): user.sound_test_log('motor:repeat')
parrot(motor:stop): user.sound_test_log('motor:stop')
parrot(shh_loud): user.sound_test_log('shh_loud')
parrot(shh_loud:repeat): user.sound_test_log('shh_loud:repeat')
parrot(shh_loud:stop): user.sound_test_log('shh_loud:stop')
parrot(shh_soft): user.sound_test_log('shh_soft')
parrot(shh_soft:repeat): user.sound_test_log('shh_soft:repeat')
parrot(shh_soft:stop): user.sound_test_log('shh_soft:stop')
parrot(spit): user.sound_test_log('spit')
parrot(sss_loud): user.sound_test_log('sss_loud')
parrot(sss_loud:repeat): user.sound_test_log('sss_loud:repeat')
parrot(sss_loud:stop): user.sound_test_log('sss_loud:stop')
parrot(sss_soft): user.sound_test_log('sss_soft')
parrot(sss_soft:repeat): user.sound_test_log('sss_soft:repeat')
parrot(sss_soft:stop): user.sound_test_log('sss_soft:stop')
parrot(whistle_high): user.sound_test_log('whistle_high')
parrot(whistle_high:repeat): user.sound_test_log('whistle_high:repeat')
parrot(whistle_high:stop): user.sound_test_log('whistle_high:stop')
parrot(whistle_low): user.sound_test_log('whistle_low')
parrot(whistle_low:repeat): user.sound_test_log('whistle_low:repeat')
parrot(whistle_low:stop): user.sound_test_log('whistle_low:stop')
