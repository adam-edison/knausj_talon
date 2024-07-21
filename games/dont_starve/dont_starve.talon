win.title: /^Don't Starve$/
os: windows
-

holding: user.starve_hold_action()
stopping: user.starve_release_action()

[move] north: user.starve_move_north()
[move] south: user.starve_move_south()
[move] east: user.starve_move_east()
[move] west: user.starve_move_west()
[move] northeast: user.starve_move_northeast()
[move] northwest: user.starve_move_northwest()
[move] southeast: user.starve_move_southeast()
[move] southwest: user.starve_move_southwest()
[move] (center | stop): user.starve_stop()


