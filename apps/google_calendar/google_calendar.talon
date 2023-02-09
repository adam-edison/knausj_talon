# tag: browser
# browser.host: /calendar\.google\.com/
win.title: /Google Calendar/
-

done here:
  mouse_click()
  sleep(500ms)
  key(tab enter)
  sleep(500ms)
  key(tab home)
  insert("✅ ")
  sleep(500ms)
  edit.save()
  sleep(500ms)
  # this event only
  key(enter)

done open:
  key(tab enter)
  sleep(500ms)
  key(tab home)
  insert("✅")
  sleep(200ms)
  edit.save()
  sleep(500ms)
  # this event only
  key(enter)

# TODO: AGE: extract to py to avoid duplication
key(keypad_6):
  mouse_click()
  sleep(500ms)
  key(tab enter)
  sleep(500ms)
  key(tab home)
  insert("✅ ")
  sleep(500ms)
  edit.save()
  sleep(500ms)
  # this event only
  key(enter)
