win.title: /OCTOPATH TRAVELER/
mode: command
-
settings():
  # Necessary to stop commands like 'slap' getting jumbled
  key_wait = 10.0

<phrase>: skip()

parrot(hiss): key(o:4)
parrot(kik): key(w)
parrot(cluck): key(s)
parrot(fft): key(enter)
parrot(tsk): key(escape)

item <number_small>:
  number = number_small or 0
  times = number - 1
  key(s)
  repeat(times - 1)
  key(enter)

victory: 
  key(e)
  sleep(1000ms)
  key(e)
  sleep(500ms)
  key(e)

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

cast fire:
  key(down enter enter enter)

cast ice:
  key(down enter down enter enter)

skip this now:
  key(backspace:down)
  sleep(6000ms)
  key(backspace:up)

collect: key(down enter enter)

switch attack: key(right enter)

running: key(shift:down)
walking: key(shift:up)

last: key(enter)

next: key(right)

boost: key(o)

level slash: key(down enter enter enter)

trade tempest: key(down enter down down enter enter)

defend: key(down:3 enter)

get me the hell out of here: key(down:4 enter)