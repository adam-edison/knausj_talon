from .user_settings import get_list_from_csv
from talon import Module, Context
from urllib.parse import quote_plus
import webbrowser

mod = Module()
mod.list("website", desc="A website.")
mod.list(
    "search_engine",
    desc="A search engine.  Any instance of %s will be replaced by query text",
)

website_defaults = {
    "amazon": "https://www.amazon.com/",
    "dropbox": "https://dropbox.com/",
    "google": "https://www.google.com/",
    "google calendar": "https://calendar.google.com",
    "google maps": "https://maps.google.com/",
    "google scholar": "https://scholar.google.com/",
    "gmail": "https://mail.google.com/",
    "github": "https://github.com/",
    "gist": "https://gist.github.com/",
    "wikipedia": "https://en.wikipedia.org/",
    "youtube": "https://www.youtube.com/",
}

_search_engine_defaults = {
    "amazon": "https://www.amazon.com/s/?field-keywords=%s",
    "google": "https://www.google.com/search?q=%s",
    "map": "https://maps.google.com/maps?q=%s",
    "scholar": "https://scholar.google.com/scholar?q=%s",
    "wiki": "https://en.wikipedia.org/w/index.php?search=%s",
}

websites_escaped = {
    "work audit": "https://teamup.com/c/moqsyr/personal?tz=America%2FNew_York&view=TA&date=2022-02-01&filterby=10462212&filterby_status[]=completed&dateRange=week&numberOfDays=5&numberOfWeeks=4&tableCells=[{\"label\":\"table_view.table.cells.start\",\"id\":\"start\",\"visible\":true,\"active\":true,\"width\":140,\"position\":0,\"definitionType\":\"default\"},{\"label\":\"table_view.table.cells.end\",\"id\":\"end\",\"visible\":true,\"active\":true,\"width\":140,\"position\":1,\"definitionType\":\"default\"},{\"label\":\"table_view.table.cells.recurrence\",\"id\":\"recurrence\",\"visible\":true,\"active\":true,\"width\":100,\"position\":3,\"definitionType\":\"default\"},{\"label\":\"table_view.table.cells.title\",\"id\":\"builtin_title\",\"visible\":true,\"position\":4,\"active\":true,\"width\":200,\"definitionType\":\"builtin_title\"},{\"label\":\"table_view.table.cells.calendars\",\"id\":\"builtin_calendars\",\"visible\":true,\"position\":5,\"active\":true,\"width\":150,\"definitionType\":\"builtin_calendars\"},{\"label\":\"table_view.table.cells.who\",\"id\":\"builtin_who\",\"visible\":true,\"position\":6,\"active\":false,\"width\":100,\"definitionType\":\"builtin_who\"},{\"label\":\"table_view.table.cells.where\",\"id\":\"builtin_location\",\"visible\":true,\"position\":7,\"active\":true,\"width\":100,\"definitionType\":\"builtin_location\"},{\"label\":\"Status\",\"id\":\"status\",\"visible\":true,\"position\":8,\"active\":true,\"width\":100,\"definitionType\":\"choices\"},{\"label\":\"Position\",\"id\":\"position\",\"visible\":true,\"position\":9,\"active\":true,\"width\":100,\"definitionType\":\"choices\"},{\"label\":\"table_view.table.cells.signup\",\"id\":\"builtin_signup\",\"visible\":false,\"position\":10,\"active\":false,\"width\":100,\"definitionType\":\"builtin_signup\"},{\"label\":\"table_view.table.cells.notes\",\"id\":\"builtin_notes\",\"visible\":true,\"position\":11,\"active\":true,\"width\":200,\"definitionType\":\"builtin_notes\"},{\"label\":\"table_view.table.cells.comments\",\"id\":\"builtin_comments\",\"visible\":false,\"position\":12,\"active\":true,\"width\":100,\"definitionType\":\"builtin_comments\"}]&wrapContent=true&customStartDate=2022-01-24&customEndDate=2022-01-30&sortBy=[{\"cell\":\"start\",\"direction\":\"asc\"}]",
    "week plan": "https://teamup.com/c/moqsyr/personal?tz=America%2FNew_York&view=W&filterby_status[]=planned&calendars=10409441,10466474,10462040,10409529,10474454,10474664,10409449,10474292,10468129,10443605,10409446,10462154,10409444,10409450,10409451,10462025,10462212,10421233,10462213"
}

ctx = Context()
ctx.lists["self.website"] = get_list_from_csv(
    "websites.csv",
    headers=("URL", "Spoken name"),
    default=website_defaults,
) | websites_escaped

ctx.lists["self.search_engine"] = get_list_from_csv(
    "search_engines.csv",
    headers=("URL Template", "Name"),
    default=_search_engine_defaults,
)


@mod.action_class
class Actions:
    def open_url(url: str):
        """Visit the given URL."""
        webbrowser.open(url)

    def search_with_search_engine(search_template: str, search_text: str):
        """Search a search engine for given text"""
        url = search_template.replace("%s", quote_plus(search_text))
        webbrowser.open(url)
