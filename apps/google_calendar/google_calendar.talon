# tag: browser
# browser.host: /calendar\.google\.com/
win.title: /Google Calendar/
-

done here:
  mouse_click()
  sleep(200ms)
  key(tab enter)
  sleep(500ms)
  key(tab home)
  insert("✅")
  sleep(200ms)
  edit.save()
  sleep(500ms)
  # this event only
  key(enter)

