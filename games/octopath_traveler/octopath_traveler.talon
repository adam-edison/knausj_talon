win.title: /OCTOPATH TRAVELER/
mode: command
-
settings():
  # Necessary to stop commands like 'slap' getting jumbled
  key_wait = 15.0

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

resume game: 
  key(enter)
  sleep(1000ms)
  key(escape)

victory: 
  key(e)
  sleep(1000ms)
  key(e)
  sleep(500ms)
  key(e)

purchase next: 
  key(down enter)
  sleep(500ms)
  key(up enter)

action: key(j)

go yes:
  key(up)
  key(enter)

go no:
  key(down)
  key(enter)

(close it | closet): key(backspace)

proceed: key(enter:2)

quick talk:
  user.advance_dialog(5)
  repeat(10)

slow talk:
  user.advance_dialog(9)
  repeat(10)


skip this now:
  key(backspace:down)
  sleep(6000ms)
  key(backspace:up)

collect: key(down enter enter)

switch attack: key(right enter)

running: key(shift:up shift:down)
walking: key(shift:down shift:up)

# olberic
level slash: key(down enter:3)
cross strike: key(down enter down:2 enter)
stout wall: key(down enter down:3 enter:2)
the dude abides: key(down enter down enter:2)
thousand spears: key(down enter down:4 enter)

# tressa
tempest: key(down enter down:3 enter:2)
trade winds: key(down enter down enter)

# ophelia
luminescence: key(down:2 enter down:2 enter:2)
holy light: key(down:2 enter down enter:2)
boost holy light: key(o:4 down:1 enter down enter:2)
heal wounds: key(down:2 enter:3)
heal more: key(down:2 enter down:3 enter:2)
boost heal more: key(o:4 down:1 enter down:3 enter:2)

# cyrus
analyze: key(down enter down:2 enter)
cast fire: key(down enter enter:2)
cast ice: key(down enter down enter:2)
double lightning: key(down enter down:3 enter:2)
double fire: key(down enter down:4 enter:2)

# alfyn
last stand: key(down:2 enter up enter:2)
boost last stand: key(o:4 down:1 enter up enter:2)
first aid: key(down:2 enter:2)
boost amputate: key(o:4 down:1 enter down:3 enter)

# all
defend: key(up:2 enter)
(get me the hell out of here | fly you fools): key(down:4 enter)
last: key(enter)
next: key(right)
boost: key(o)
olive of life: key(down:2 enter down:10)
