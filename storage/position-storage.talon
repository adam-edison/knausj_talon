# storage.set('key', value)
# storage.get('key') == value

store mouse <number>: user.store_set_mouse_position("mouse {number}")
get mouse <number>: user.store_get_mouse_position("mouse {number}")
insert mouse <number>: insert(user.store_get_mouse_position("mouse {number}"))
insert click at mouse <number>:
    position = user.store_get_mouse_position("mouse {number}")
    insert("user.mouse_move({position})\n")
    insert("mouse_click()")