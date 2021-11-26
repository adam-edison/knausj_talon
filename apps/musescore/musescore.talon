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

{user.musical_duration}:
    user.change_rhythm(user.musical_duration)

rest:
    user.insert_rest()

dotted:
    user.toggle_dotted()

dotted {user.musical_duration} rest:
    user.change_rhythm(user.musical_duration)
    user.toggle_dotted()
    user.insert_rest()