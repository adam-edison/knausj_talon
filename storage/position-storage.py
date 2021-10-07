import os
import pathlib
import subprocess

from talon import Context, Module, actions, app, ctrl, storage, clip

ctx = Context()
mod = Module()

# TODO: AGE - store the entire object in one storage object, and retrieve keys to use as commands in list

# Adam Edison  1:37 PM
# maybe... I think save store <user.text> will work, but get store <user.text>  probably wouldn't - too many differences in recognition without a defined set.

# aegis:talon:  1:37 PM
# that's fine
# 1:37
# just use a list.
# Added to your saved items

# Adam Edison  1:37 PM
# is there a way to add to a list dynamically?
# Added to your saved items

# aegis:talon:  1:37 PM
# yes.
# Added to your saved items
# 1:37
# you can also just jam a whole dict into storage
# :heart:
# 1

# Added to your saved items
# 1:38
# as long as it's primitive types (encodes as json)
# Added to your saved items
# 1:38
# at talon startup, do ctx.lists["your list name"] = storage.get("storage key", {}).keys() (edited) 
# Added to your saved items
# 1:38
# then every time you update the storage object, also set the list via ctx.lists["your list name"] = keys (edited) 

@mod.action_class
class Actions:
    def store_set_mouse_position(key: str):
        """Sets the current mouse position coordinates in storage"""
        position =  ctrl.mouse_pos()
        x = round(position[0])
        y = round(position[1])
        value = f"{x}, {y}"
        storage.set(key, value)
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