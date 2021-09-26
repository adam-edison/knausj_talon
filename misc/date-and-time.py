from datetime import timedelta, date, datetime
from talon import ctrl, ui, Module, actions

mod = Module()


@mod.action_class
class Actions:
    def date_slash_format(offsetDays:int=0):
        """Returns the date (today + offset) in MM/DD/YYYY"""
        endDate = date.today() + timedelta(days=offsetDays)
        result = endDate.strftime("%m/%d/%Y")
        return result

    def date_dash_format(offsetDays:int=0):
        """Returns the date (today + offset) in YYYY-MM-DD"""
        endDate = date.today() + timedelta(days=offsetDays)
        result = endDate.strftime("%Y-%m-%d")
        return result

    def date_dash_day_format(offsetDays:int=0):
        """Returns the date (today + offset) in YYYY-MM-DD ddd"""
        endDate = date.today() + timedelta(days=offsetDays)
        result = endDate.strftime("%Y-%m-%d %a")
        return result
    
    def date_mdy_format(offsetDays:int=0):
        """Returns the date (today + offset) in MMM DD, YYYY"""
        endDate = date.today() + timedelta(days=offsetDays)
        result = endDate.strftime("%b %d, %Y")
        return result

    def time_now_12h():
        """Returns the date (today + offset) in MMM DD, YYYY"""
        now = datetime.now()
        result = now.strftime("%H:%M %p")
        return result
