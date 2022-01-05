from talon import ctrl, ui, Module, Context, actions, clip, app

ctx = Context()
mod = Module()

@mod.action_class
class Actions:
    def complete_this_event_by_vimium(navigation: str):
        """complete this calendar event by sending the navigation string first"""
        Actions.edit_event_by_vimium(navigation=navigation)
        actions.sleep("1000ms")
        Actions.complete_this_open_event()

    def complete_this_event_under_cursor():
        """complete this calendar event under the mouse cursor"""
        Actions.edit_event_under_cursor()
        actions.sleep("1000ms")
        Actions.complete_this_open_event()

    def complete_this_open_event():
        """mark this calendar event as completed"""
        actions.user.paste("✅ ")
        actions.key("cmd-s")
        actions.sleep("200ms")
        actions.key("enter")

    def edit_event_under_cursor():
        """edit this calendar event under the mouse cursor"""
        ctrl.mouse_click()
        event_edit_to_title_field()

    def duplicate_event_under_cursor():
        """duplicate this calendar event under the mouse cursor"""
        ctrl.mouse_click()
        event_duplicate_button()
        actions.sleep("1000ms")
        actions.key("cmd-s")

    def edit_event_by_vimium(navigation:str):
        """edit this calendar event by sending the navigation string first"""
        actions.insert(navigation)
        event_edit_to_title_field()

    def delete_event_by_vimium(navigation:str):
        """delete this calendar event by sending the navigation string first"""
        actions.insert(navigation)
        event_delete_single()

def set_event_color_graphite():
    if (not actions.user.screen_contains_image("gcal-calendar-icon")):
        actions.user.click_center_image("gcal-calendar-icon-sunset")
    else:
        actions.user.click_center_image("gcal-calendar-icon")
    
    actions.sleep("100ms")
    actions.key("tab:2")
    actions.key("down")
    actions.sleep("500ms")
    actions.key("up")
    actions.sleep("50ms")
    actions.key("left")
    actions.sleep("100ms")
    actions.key("enter")
    actions.sleep("500ms")

def event_edit_to_title_field():
    actions.sleep("800ms")
    actions.key("tab")
    actions.sleep("50ms")
    actions.key("enter")
    actions.sleep("500ms")
    actions.key("tab")
    actions.sleep("50ms")
    actions.key("home")
    actions.sleep("50ms")

def event_duplicate_button():
    actions.sleep("1000ms")
    actions.key("tab:4")
    actions.sleep("500ms")
    actions.key("down:2 enter")

def event_delete_single():
    actions.sleep("1000ms")
    actions.key("tab:2")
    actions.sleep("500ms")
    actions.key("enter")

    # single
    actions.sleep("1000ms")
    actions.key("enter")