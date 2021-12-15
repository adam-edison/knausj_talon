from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()

mod.list('teamup_calendar', desc='names of subcalendars')
mod.list('teamup_position', desc='general physical position for activity')
mod.list('teamup_status', desc='status of an event')
mod.list('teamup_priority', desc='priority of an event')

ctx.lists['self.teamup_calendar'] = {
    "appointments": "appointments",
    "chores": "chores",
    "completed": "completed",
    "exercise": "exercise",
    "fun": "fun",
    "health": "health",
    "recovery": "recovery",
    "job": "job",
    "talon": "talon",
}

ctx.lists['self.teamup_position'] = {
    "sitting": "sitting",
    "standing": "standing",
    "mixed": "mixed",
    "moving": "moving",
    "reclining": "reclining",
    "lying": "lying",
}

ctx.lists['self.teamup_status'] = {
    "planned": "planned",
    "skipped": "skipped",
    "complete": "complete",
}

ctx.lists['self.teamup_priority'] = {
    "urgent": "urgent",
    "high": "high",
    "medium": "medium",
    "low": "low",
}


# lazy loads the locations of controls in the gui - if we've found them once, don't search for them again
control_locations = {}

mouse_start = {}

@mod.action_class
class Actions:
    def teamup_clear_image_locations():
        """clear the stored image locations (in case the GUI has changed position on the screen)"""
        control_locations.clear()

    def teamup_undo_toast():
        """click undo toast message"""
        click_center_control("teamup-undo-toast")

    def teamup_delete_menu():
        """delete the current event via quick menu"""
        click_through_to_where_input()
        click_center_control("teamup-delete-button")
        revert_to_original_mouse_position()

    def teamup_save():
        """click the save button"""
        click_center_control("teamup-save-button")

    def teamup_click_single():
        """click the single button"""
        click_center_control("teamup-single")

    def teamup_click_future():
        """click the future button"""
        click_center_control("teamup-future")
    
    def teamup_duplicate_event(calendar: str):
        """duplicate the event under the mouse pointer, to the supplied calendar"""

        ctrl.mouse_click(1)
        actions.sleep("200ms")
        click_center_control("teamup-duplicate-menu")


        wait_for_event_details_loading()
        click_input_beneath("teamup-where-label")

        actions.key("shift-tab")
        clear_input()
        actions.insert(f"{calendar}\n")
        
        click_center_control("teamup-save-button")
        revert_to_original_mouse_position()

    def teamup_event_under_mouse_set_defaults(status: str, priority: str, position: str, timer: str):
        """set the default custom fields for the calendar event currently under the mouse pointer"""
        
        click_through_to_where_input()

        actions.key("tab")
        clear_input()
        actions.insert(f"{status}\n")

        actions.key("tab")
        clear_input()
        actions.insert(f"{priority}\n")

        actions.key("tab")
        clear_input()
        actions.insert(f"{position}\n")

        actions.key("tab")
        clear_input()
        actions.insert(f"{timer}")

        click_center_control("teamup-save-button")
        revert_to_original_mouse_position()

    def teamup_event_sprint_work(position: str):
        """insert sprint work event, where event details is open and focused at event title"""
        
        actions.insert(f"Sprint Work")

        actions.key("tab:7")
        clear_input()
        actions.insert(f"job\n")

        actions.key("tab:2")
        clear_input()
        actions.insert(f"planned\n")

        actions.key("tab")
        clear_input()
        actions.insert(f"medium\n")

        actions.key("tab")
        clear_input()
        actions.insert(f"{position}\n")

        actions.key("tab")
        clear_input()
        actions.insert(f"manual")

        click_center_control("teamup-save-button")

    def teamup_event_under_mouse_status_value(value: str):
        """set the Status value for the event currently under the mouse pointer"""
        click_event_and_set_field(1, f"{value}\n")

    def teamup_event_under_mouse_priority_value(value: str):
        """set the Priority value for the event currently under the mouse pointer"""
        click_event_and_set_field(2, f"{value}\n")

    def teamup_event_under_mouse_position_value(value: str):
        """set the Position value for the event currently under the mouse pointer"""
        click_event_and_set_field(3, f"{value}\n")

    def teamup_event_under_mouse_timer_value(value: str):
        """set the Timer value for the event currently under the mouse pointer"""
        click_event_and_set_field(4, value)

def click_event_and_set_field(field: int, value: str):
    click_through_to_where_input()

    actions.key(f"tab:{field}")
    clear_input()
    actions.insert(value)
    
    click_center_control("teamup-save-button")
    revert_to_original_mouse_position()

def click_through_to_where_input():
    position = ctrl.mouse_pos()
    mouse_start['x'] = position[0]
    mouse_start['y'] = position[1]
    ctrl.mouse_click(0)
    wait_for_event_details_loading()
    click_input_beneath("teamup-where-label")
    wait_for_slow_ui()

def wait_for_event_details_loading():
    actions.sleep("800ms")

def wait_for_slow_ui():
    actions.sleep("200ms")

def click_center_control(controlName: str):
    location = get_control_center_point(controlName) # 0 = x, 1 = y
    actions.user.mouse_move(location[0], location[1])
    actions.sleep("100ms")
    ctrl.mouse_click(0)

def revert_to_original_mouse_position():
    ctrl.mouse_move(mouse_start['x'], mouse_start['y'])

def click_input_beneath(controlName: str):
    location = get_control_center_point(controlName) # 0 = x, 1 = y
    location = [location[0], location[1] + 25]
    actions.user.mouse_move(location[0], location[1])
    ctrl.mouse_click(0)

def get_control_center_point(controlName: str):

    if control_locations.get(controlName) is None:
        all_locations = actions.user.get_image_locations(controlName, 0.65)

        if len(all_locations) == 0:
            print(f"Unable to find control for {controlName}. Aborting...")

        control_locations[controlName] = actions.user.get_image_locations(controlName, 0.65)[0]
        print(f"Added {controlName} in {control_locations}")

    location = control_locations.get(controlName)
    
    clickX = int(location.x + location.width / 2)
    clickY = int(location.y + location.height / 2)
    return [clickX, clickY]

def clear_input():
    actions.edit.delete_line()
    actions.key("backspace:3")

# TODO: make a debug print function that only works if debug mode is enabled in settings