import os
import pathlib
import subprocess

from talon import Context, Module, actions, app, ctrl, storage, clip

ctx = Context()
mod = Module()

mod.list('terran_structures', desc='names of terran structures')
ctx.lists['self.terran_structures'] = {
    "center": "command center",
    "barracks": "barracks",
    "factory": "factory",
    "starport": "starport",
}

@mod.action_class
class Actions:
    def select_structure(key: str):
        """Selects a given structure based upon stored mini map and main view coordinates"""
        position =  ctrl.mouse_pos()
        x = storage.get(f"{key}_x")
        y = round(position[1])
        value = f"{x}, {y}"
        storage.set(key, value)
        app.notify(f"mouse: (x,y) = ({value})")
        return value

    def store_get_mouse_position(key: str):
        """Gets the mouse position coordinates from storage and throws them on the clipboard"""
        value = storage.get(key)
        return value

    def store_mouse_coordinates_separately(key: str):
        """Sets the current mouse position coordinates x/y separately in storage"""
        position =  ctrl.mouse_pos()
        x = round(position[0])
        y = round(position[1])
        storage.set(f"{key}_x", x)
        storage.set(f"{key}_y", y)

    def get_mouse_x(key: str):
        """Gets the current mouse position x coordinate from storage"""
        return storage.get(f"{key}_x")

    def get_mouse_y(key: str):
        """Gets the current mouse position y coordinate from storage"""
        return storage.get(f"{key}_y")

    def starcraft_scout():
        """Make the selected unit scout in the mini map"""
        for x in range(10):
            actions.key("shift:down")
            ctrl.mouse_click(1)
            actions.key("shift:up")
            actions.sleep("500ms")