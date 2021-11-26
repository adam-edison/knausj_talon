os: mac
app.name: /MuseScore/
-

settings():
    key_wait = 3

# Add some MuseScore Talon voice commands for rhythm entry to be easier

# "<duration> <letter>"
# "<duration> <rest>"
# "stack <interval 2nd through 9th> <above/below>"
# "stack <letter> <above/below>"
# "<duration> tied to <duration>"
# "<up/down> semi"

# Try to work on score with these shortcuts

(rhythm | hit) {user.musical_duration}+:
    user.insert_single_note_rhythm(user.musical_duration)

{user.musical_duration} {user.letter}:
    user.change_rhythm(user.musical_duration)
    user.insert_note(user.letter)

rest:
    user.insert_rest()

dotted:
    user.toggle_dotted()

dotted {user.musical_duration} rest:
    user.change_rhythm(user.musical_duration)
    user.toggle_dotted()
    user.insert_rest()

tie:
    key(shift-=)