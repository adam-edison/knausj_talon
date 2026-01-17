from talon import Module

mod = Module()
mod.apps.todoist = r"""
os: mac
and app.bundle: com.todoist.mac.Todoist
os: mac
and win.title: /Todoist -/
"""
