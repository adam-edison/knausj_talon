import platform
from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()

mod.list('teamup_calendar', desc='names of subcalendars')
mod.list('teamup_position', desc='general physical position for activity')
mod.list('teamup_status', desc='status of an event')

ctx.lists['self.teamup_calendar'] = {
    "job": "job",
    "talon": "talon",
    "admin": "admin",
    "qi gong": "qi gong",
    "care": "care",
    "exercise": "exercise",
    "housework": "housework",
    "appointments": "appointments",
    "social": "social",
    "fun": "fun",
}

ctx.lists['self.teamup_position'] = {
    "standing": "standing",
    "sitting": "sitting",
    "moving": "moving",
    "lying": "lying",
    "multi": "multi",
}

ctx.lists['self.teamup_status'] = {
    "planned": "planned",
    "skipped": "skipped",
    "completed": "completed",
    "in progress": "in progress",
    "done minimally": "done minimally",
}

# lazy loads the locations of controls in the gui - if we've found them once, don't search for them again
# TODO: downscale the images (half resolution using Preview)
# TODO: test without memorized locations - is it fast enough?
# TODO: if downscaled images without memorized locations is still too slow, perhaps use save button as key image and others are stored relative to that location
image_locations = {}

mouse_start = {}

@mod.action_class
class Actions:
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

    def teamup_set_to_calendar(calendar: str):
        """sets the event calendar under the mouse pointer, to the supplied calendar"""

        click_through_to_where_input()

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
        
    def teamup_title(title: str):
        """set title of an event"""
        ctrl.mouse_click(0)
        wait_for_event_details_loading()
        actions.edit.select_line()
        actions.insert(f"{title}\n")

    def teamup_event_sprint_work(position: str, minutes: int):
        """insert sprint work event, where event details is open and focused at event title"""
        
        Actions.teamup_drag_event(minutes, "down")

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

    def teamup_drag_event(minutes: int, direction: str):
        """dragged the mouse down, based upon the minutes provided in the minutes"""
        actions.user.mouse_down(0)
        actions.sleep("800ms")

        adjustment = 0

        if direction == "down" and minutes < 10:
            adjustment = 4 * minutes

        if direction == "down" and minutes >= 10:
            adjustment = 3.5 * minutes

        if direction == "up":
            adjustment = -3.5 * minutes

        actions.user.mouse_move_relative(0, adjustment)
        actions.sleep("500ms")
        actions.user.mouse_up(0)

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

# TODO: this image location dictionary really needs to become its own module - outside of teamup entirely

def get_control_center_point(controlName: str):
    imageName = controlName

    if (platform.system() == "Windows"):
        imageName += "-windows"

    all_locations = actions.user.get_image_locations(imageName, 0.65)

    if len(all_locations) == 0:
        raise Exception(f"Unable to find control for {imageName}. Aborting...")

    location = all_locations[0]
    
    clickX = int(location.x + location.width / 2)
    clickY = int(location.y + location.height / 2)
    return [clickX, clickY]

def clear_input():
    actions.edit.delete_line()
    actions.key("backspace:3")

# TODO: make a debug print function that only works if debug mode is enabled in settings

# TODO: revamp this to have all image positions be relative to a single image position that is found every time

# TODO: saying in progress makes it also start a timer for the length of the event