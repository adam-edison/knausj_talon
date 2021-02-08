from talon import actions, noise, Module
mod = Module()
@mod.action_class
class Actions:
    def pop():
        """Called when you make a popping sound"""
        actions.skip()
    def hiss_start():
        """Called when hiss starts"""
        actions.skip()
    def hiss_end():
        """Called when hiss ends"""
        actions.skip()
def on_hiss(active):
    if active:
        actions.user.hiss_start()
    else:
        actions.user.hiss_end()
noise.register('pop', lambda active: actions.user.pop())
noise.register('hiss', on_hiss)