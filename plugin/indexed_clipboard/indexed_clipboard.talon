copier <user.word>: user.indexed_clipboard_copy(word)
copier <user.word> key: user.indexed_clipboard_copy("{word}:key")
copier <user.word> value: user.indexed_clipboard_copy("{word}:value")

paster {user.clipboard_index}: user.indexed_clipboard_paste(clipboard_index)
paster <user.word> key: user.indexed_clipboard_paste("{word}:key:")
paster <user.word> value: user.indexed_clipboard_paste("{word}:value")

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