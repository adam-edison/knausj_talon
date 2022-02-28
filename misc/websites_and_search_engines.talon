open {user.website}: user.open_url(website)

# needed to suppress bad recognition here
open {user.website} <number>: user.open_url(website)

{user.search_engine} hunt <user.text>$: user.search_with_search_engine(search_engine, user.text)
{user.search_engine} (that|this):
    text = edit.selected_text()
    user.search_with_search_engine(search_engine, text)