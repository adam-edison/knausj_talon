from talon import Context, Module, actions, app

mod = Module()
ctx = Context()


@mod.action_class
class Actions:
    def wait_and_press(time: str, keys: str):
        """Waits for [time] and calles key() with [keys]"""
        actions.sleep(time)
        actions.key(keys)
