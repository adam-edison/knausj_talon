os: mac
app: slack
-

react ship: 
  mouse_click(1)
  sleep(100ms)
  key(r)
  sleep(100ms)
  insert(":ship")
  sleep(100ms)
  key(enter)

react (thanks|thank you): 
  mouse_click(1)
  sleep(100ms)
  key(r)
  sleep(100ms)
  insert(":thankyou")
  sleep(100ms)
  key(enter)

react looking: 
  mouse_click(1)
  sleep(100ms)
  key(r)
  sleep(100ms)
  insert(":eyes")
  sleep(100ms)
  key(enter)
  
react (done|complete): 
  mouse_click(1)
  sleep(100ms)
  key(r)
  sleep(100ms)
  insert(":white_check_mark")
  sleep(100ms)
  key(enter)