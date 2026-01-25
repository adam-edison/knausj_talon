# for when there is dropdown, and the first item is NOT selected
choose blank <number_small>:
  key("down:{number_small}")
  sleep(100ms)
  key(enter)

# for when there is dropdown, and the first item is selected
choose <number_small>:
  movement = number_small - 1
  key("down:{movement}")
  sleep(100ms)
  key(enter)