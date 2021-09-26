os: mac
app: chrome
-
open [dev] <number>: user.open_link_new_tab("https://touchtown.atlassian.net/browse/TTDEV-{number}")
open prod <number>: user.open_link_new_tab("https://touchtown.atlassian.net/browse/TTPROD-{number}")

show [dev] <number>: user.open_link_current_tab("https://touchtown.atlassian.net/browse/TTDEV-{number}")