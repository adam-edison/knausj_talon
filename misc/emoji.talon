mode: command
-

emoji {user.emoji_names}:
    user.emoji_insert_spaced(emoji_names) 

mark {user.emoji_names}:
    user.emoji_mark_line(emoji_names)

mark clear:
    user.emoji_clear_line()

mark set {user.emoji_names}:
    user.emoji_clear_line()
    user.emoji_mark_line(emoji_names)