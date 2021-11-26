from talon import Context, Module, actions

mod = Module()
mod.list("musical_duration", desc="Musical Note Durations")
mod.list("musical_letter", desc="Musical Note Letter Names")
mod.list("musical_interval", desc="Musical Note Intervals")
mod.list("musical_direction", desc="Musical Note Directions")
mod.list("musical_position", desc="Musical Note Positions")

ctx_default = Context()
ctx_default.lists["user.musical_duration"] = {
    "whole": "7",
    "half": "6",
    "quarter": "5",
    "eighth": "4",
    "sixteenth": "3",
    "thirty second": "2",
}

ctx_default.lists["user.musical_interval"] = {
    "second": "second",
    "third": "third",
    "fourth": "fourth",
    "fifth": "fifth",
    "sixth": "sixth",
    "seventh": "seventh",
    "octave": "octave",
    "ninth": "ninth",
    # "tenth": "tenth",
    # "eleventh": "eleventh",
    # "twelfth": "twelfth",
    # "thirteenth": "thirteenth",
}

ctx_default.lists["user.musical_direction"] = {
    "up": "up",
    "down": "down",
}

ctx_default.lists["user.musical_direction"] = {
    "above": "above",
    "below": "below",
}

@mod.action_class
class Actions:

    def change_rhythm(duration: str):
        """change rhythm duration"""
        actions.insert(f"${duration}")

    def insert_rest():
        """insert a rest"""
        actions.key("0")
    
    def insert_note(letter: str):
        """insert a note"""
        actions.insert(f"${letter}")

    def toggle_dotted():
        """toggle dot duration"""
        actions.key(".")

    def insert_single_note_rhythm(duration: str):
        """insert the rhythm on A"""
        Actions.change_rhythm(duration)
        Actions.insert_note("a")


# Add some MuseScore Talon voice commands for rhythm entry to be easier

# "<duration> <letter>"
# "<duration> <rest>"
# "stack <interval 2nd through 9th> <above/below>"
# "stack <letter> <above/below>"
# "<duration> tied to <duration>"
# "<up/down> semi"

# Try to work on score with these shortcuts