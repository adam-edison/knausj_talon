win.title: /OCTOPATH TRAVELER/
mode: command
-
settings():
  # Necessary to stop commands like 'slap' getting jumbled
  key_wait = 15.0

<phrase>: skip()

parrot(kik): key(w)
parrot(cluck): key(s)
parrot(fft): key(enter)
parrot(hiss): key(escape)


sell one: 
  key(enter:2)
  sleep(500ms)
  key(up enter)

path <number_small>:
  key(j)
  sleep(300ms)
  user.octopath_list(number_small)


go <number_small>:
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

very (quick|fast) talk:
  user.octopath_advance_dialog(3)
  repeat(10)

(quick|fast) talk:
  user.octopath_advance_dialog(5)
  repeat(10)

slow talk:
  user.octopath_advance_dialog(9)
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
thousand spears: user.octopath_menu(2, 6)

# tressa
tempest: key(down enter down:3 enter:2)
trade winds: key(down enter down enter)

# therion
share skill: user.octopath_menu(2, 7)
wildfire: user.octopath_menu(2, 2)

# ophelia
luminescence: user.octopath_menu(3, 3)
holy light: user.octopath_menu(3, 3)
heal wounds: user.octopath_menu(3, 1)
heal more: user.octopath_menu(3, 4)

# cyrus
analyze: user.octopath_menu(2, 3)
cast fire: user.octopath_menu(2, 1)
cast ice: user.octopath_menu(2, 2)
double lightning: user.octopath_menu(2, 4)
double fire: user.octopath_menu(2, 5)
double ice: user.octopath_menu(2, 6)

# alfyn
last stand: key(down:2 enter up enter:2)
first aid: key(down:2 enter:2)
amputate: key(down:2 enter down:3 enter)

# primrose
darkness:  user.octopath_menu(3, 3)

# all
to all: key(enter:2)  
defend: key(up:2 enter)
(get me the hell out of here | fly you fools): user.octopath_menu(5, 0)
last: key(enter)
next: key(right)
single$: key(o)
double$: key(o:2)
max$: key(o:4)
olive of life: user.octopath_menu(3, 11)
