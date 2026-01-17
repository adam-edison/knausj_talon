os: windows
mode: user.game
title: /Everspace 2/
-


air: user.game_xbox_button_hold("a", 1000)
long air: user.game_xbox_button_hold("a", 4000)

parrot(shh): user.game_xbox_left_trigger_hold(1.0)
parrot(shh:repeat): user.game_xbox_left_trigger_hold(1.0)
parrot(shh:stop): user.game_xbox_left_trigger_release()

parrot(sss): user.game_xbox_right_trigger_hold(1.0)
parrot(sss:repeat): user.game_xbox_right_trigger_hold(1.0)
parrot(sss:stop): user.game_xbox_right_trigger_release()

yank: user.game_xbox_button_hold("y", 1000)
long yank: user.game_xbox_button_hold("y", 4000)

right: user.game_xbox_button_hold("right_shoulder", 1000)
left: user.game_xbox_button_hold("left_shoulder", 1000)

menu: user.game_xbox_button_hold("menu", 1000)
map: user.game_xbox_button_hold("start", 1000)
