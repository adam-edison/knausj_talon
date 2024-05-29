os: mac
app: slack
-

react ship: 
  mouse_click(1)
  sleep(300ms)
  key(r)
  sleep(300ms)
  insert(":ship")
  sleep(300ms)
  key(enter)

react (thumbs up|like):
  mouse_click(1)
  sleep(300ms)
  key(r)
  sleep(300ms)
  insert(":thumbsup")
  sleep(300ms)
  key(enter)

react (thanks|thank you): 
  mouse_click(1)
  sleep(300ms)
  key(r)
  sleep(300ms)
  insert(":thankyou")
  sleep(300ms)
  key(enter)

react looking: 
  mouse_click(1)
  sleep(300ms)
  key(r)
  sleep(300ms)
  insert(":eyes")
  sleep(300ms)
  key(enter)
  
react (done|complete): 
  mouse_click(1)
  sleep(300ms)
  key(r)
  sleep(300ms)
  insert(":white_check_mark")
  sleep(300ms)
  key(enter)