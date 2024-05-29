copier <user.word>: user.indexed_clipboard_copy(word)
paster {user.clipboard_index}: user.indexed_clipboard_paste(clipboard_index)
clip clear {user.clipboard_index}: user.indexed_clipboard_clear(clipboard_index)
clip list: user.indexed_clipboard_toggle()

copy all <user.word>: 
  edit.select_all()
  sleep(100ms)
  user.indexed_clipboard_copy(word)

paste all {user.clipboard_index}: 
  edit.select_all()
  sleep(100ms)
  user.indexed_clipboard_paste(clipboard_index)