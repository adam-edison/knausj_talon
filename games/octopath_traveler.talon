win.title: /OCTOPATH TRAVELER/
-
settings():
  # Necessary to stop commands like 'slap' getting jumbled
  key_wait = 10.0

<phrase>: skip()

parrot(hiss): key(o:4)
parrot(kik): key(w)
parrot(cluck): key(s)
parrot(fft): key(enter)

item <number_small>:
  number = number_small or 0
  times = number - 1
  key(s)
  repeat(times - 1)
  key(enter)

victory: 
  key(e)
  sleep(1000ms)
  key(e:2)

talk: key(enter)

action: key(j)

go yes:
  key(up)
  key(enter)

go no:
  key(down)
  key(enter)

(close it | closet): key(backspace)

proceed: key(enter:2)

dialog:
  key(enter)
  sleep(3000ms)
  key(enter)
  sleep(3000ms)
  key(enter)

cyrus fire:
  key(down enter enter)

cyrus ice:
  key(down enter down enter)

skip this now:
  key(backspace:down)
  sleep(6000ms)
  key(backspace:up)