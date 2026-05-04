import datetime

from talon import Module, actions

mod = Module()
mod.list("date_month_name", desc="Month names for spoken date entry")


@mod.action_class
class Actions:
    def insert_spoken_date(day: int, month: int = None) -> None:
        """Insert an ISO date from spoken month/day.

        Examples:
        - "date april 4" -> 2026-04-04
        - "date 4" -> current year/current month/04
        """
        now = datetime.datetime.now()
        year = now.year
        resolved_month = month if month is not None else now.month

        try:
            date_value = datetime.date(year, int(resolved_month), int(day))
        except ValueError:
            actions.app.notify("Invalid date")
            return

        actions.insert(date_value.strftime("%Y-%m-%d"))
