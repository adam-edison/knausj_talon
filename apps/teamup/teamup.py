from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()

mod.list('calendar', desc='URLs to visit in a browser')
ctx.lists['self.calendar'] = {
    "appointments": "appointments",
    "chores": "chores",
    "completed": "completed",
    "exercise": "exercise",
    "fun": "fun",
    "health": "health",
    "recovery": "recovery",
    "work": "work",
}


@mod.action_class
class Actions:
    def set_to_calendar(calendar: str):
        """set the calendar of the currently-open event"""
        navigate_to_calendar_field()
        # actions.key("backspace:2")
        # actions.insert(calendar)
        # actions.key("enter")



def navigate_to_calendar_field():
    actions.key("esc")
    actions.sleep("50ms")
    actions.key("f")
    actions.sleep("300ms")
    actions.key("g")
