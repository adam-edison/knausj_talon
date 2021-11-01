# storage.set('key', value)
# storage.get('key') == value

set mouse <number>: 
    user.store_set_mouse_position("mouse {number}")

get mouse <number>:
    user.store_get_mouse_position("mouse {number}")

insert mouse <number>: 
    insert(user.store_get_mouse_position("mouse {number}"))

insert click at mouse <number>:
    position = user.store_get_mouse_position("mouse {number}")
    insert("user.mouse_move({position})\n")
    insert("mouse_click()")

store <number>: 
    edit.copy()
    user.set_data_from_clipboard("clip {number}")

retrieve <number>:
    value = user.get_data("clip {number}")
    user.paste("{value}")