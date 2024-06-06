win.title: /Potionomics/
-

get <number_small>:
  times = number_small - 1
  mouse_click(0)
  repeat(times)

place <number_small>:
  user.double_click(number_small, 100)

target:
  tracking.control_toggle()
  sleep(1500ms)
  user.mouse_sleep()

# play a card
parrot(smooch): key(q)

parrot(fft): mouse_click()


# these trigger ahk scripts

expand: key(x)
end turn: key(e)
