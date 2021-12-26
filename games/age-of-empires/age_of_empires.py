from talon import Context, Module, actions, app, ctrl, storage, clip

ctx = Context()
mod = Module()


@mod.action_class
class Actions:
    def age_of_empires_mark_primary_location(key: str):
        """sets mini-map and map location"""

    def toggle_speech():
        """toggles speech recognition on and off"""
        if actions.speech.enabled():
            actions.speech.disable()
            return

        actions.speech.enable()