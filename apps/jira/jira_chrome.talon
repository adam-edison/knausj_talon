os: mac
app: chrome
-
open [kay] <number>: user.open_link_new_tab("https://kasa.atlassian.net/browse/KFC-{number}")

show [kay] <number>: user.open_link_current_tab("https://kasa.atlassian.net/browse/KFC-{number}")
