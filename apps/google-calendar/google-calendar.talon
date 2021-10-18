win.title: /Google Calendar/
-

settings():
    key_wait = 2.2

edit <user.letter>: user.edit_event_by_vimium("{letter}")
edit <user.letter> <user.letter>: user.edit_event_by_vimium("{letter_1}{letter_2}")
editor: user.edit_event_under_cursor()

complete <user.letter>: user.complete_this_event_by_vimium("{letter}")
complete <user.letter> <user.letter>: user.complete_this_event_by_vimium("{letter_1}{letter_2}")
complete this: user.complete_this_open_event()

duplicater: user.duplicate_event_under_cursor()  
