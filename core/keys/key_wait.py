from talon import Module, actions

mod = Module()


@mod.action_class
class Actions:

    def wait_and_press(time: str, keys: str):
        """Waits for [time] and calls key() with [keys]"""
        actions.sleep(time)
        actions.key(keys)

    def wait_and_slow_press(key: str):
        """Calls key() with [key] up and down with fixed delay"""
        actions.sleep("20ms")
        actions.key(f"{key}:down")
        actions.sleep("20ms")
        actions.key(f"{key}:up")
