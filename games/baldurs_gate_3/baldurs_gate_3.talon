win.title: /Baldur's Gate 3/i
-

# Mac note: BG3 on macOS uses the same in-game keybindings as PC
# (Ctrl/Shift/Alt/F1-F10). No Cmd remapping required.
#
# Defaults assumed - rebind in-game and update here if you've changed them.
# To restrict commands to a noise-only "game mode" later, add:
#   mode: user.game
# above the dash and toggle with `game mode` / `command mode`.


# ---------- Hotbar slots 1-12 (1-9, 0, -, =) ----------
slot one:    key(1)
slot two:    key(2)
slot three:  key(3)
slot four:   key(4)
slot five:   key(5)
slot six:    key(6)
slot seven:  key(7)
slot eight:  key(8)
slot nine:   key(9)
slot ten:    key(0)
slot eleven: key(-)
slot twelve: key(=)
hotbar next: key(r)
hotbar last: key(f)
toggle bar:  key(x)


# ---------- Dialogue choices (1-9 select on-screen option) ----------
# Use a distinct prefix ("speak") so it doesn't collide with hotbar.
speak one:   key(1)
speak two:   key(2)
speak three: key(3)
speak four:  key(4)
speak five:  key(5)
speak six:   key(6)
speak seven: key(7)
speak eight: key(8)
speak nine:  key(9)


# ---------- Character / party selection ----------
char one:   key(f1)
char two:   key(f2)
char three: key(f3)
char four:  key(f4)
next char:  key(])
last char:  key([)
split party | ungroup: key(g)
regroup:    key(g)
hide party: key(shift-c)
party view: key(tab)


# ---------- Combat ----------
end turn:        key(space)
turn based:      key(shift-space)
flee combat:     key(shift-space)
toggle combat:   key(tab)
sneak mode:      key(c)
weapon swap:     key(f)
sheath | unsheath: key(u)
dual wield:      key(r)


# ---------- Action keys ----------
jump it:    key(z)
shove it:   key(v)
throw it:   key(x)
search it:  key(`)


# ---------- Modifier holds (call "<x> on" then "<x> off") ----------
attack on:      key(ctrl:down)
attack off:     key(ctrl:up)
highlight on:   key(alt:down)
highlight off:  key(alt:up)
sneak peek on:  key(shift:down)
sneak peek off: key(shift:up)


# ---------- Camera ----------
tactical:     key(o)
center cam:   key(home)
zoom in:      key(pageup)
zoom out:     key(pagedown)
rotate left:  key(q)
rotate right: key(e)


# ---------- Movement (tap; hold via parrot if you wire one up) ----------
go forward: key(w)
go back:    key(s)
go left:    key(a)
go right:   key(d)


# ---------- UI panels ----------
inventory:        key(i)
character sheet:  key(n)
journal:          key(j)
spell book:       key(k)
map view:         key(m)
ui hide:          key(f10)
alchemy:          key(h)
illithid:         key(b)
inspiration:      key(p)
reactions:        key(l)
[game] menu:      key(esc)
cancel:           key(esc)


# ---------- Save / Load ----------
quick save: key(f5)
quick load: key(f8)


# ---------- Loot / confirm ----------
take all: key(space)
confirm:  key(space)


# ---------- Mouse helpers (avoid hand on mouse for combos) ----------
attack here:
    key(ctrl:down)
    mouse_click(0)
    key(ctrl:up)

ping here:
    key(alt:down)
    mouse_click(1)
    key(alt:up)

force click:   mouse_click(0)
context click: mouse_click(1)


# ---------- Parrot noises (BG3-specific overrides) ----------
# Only uses noises present in your patterns.json:
#   cha, clop, kuh, motor, puh, shh, snore, spit, sss, tih, whistle, wince
# More-specific BG3 context wins over global workflow bindings.

# --- Combat / one-shot ---
# puh: end turn / loot all (overrides global tab)
parrot(puh):     key(space)
# cha: combat / party overview (overrides global drag)
parrot(cha):     key(tab)
# spit: cancel (overrides global mode-select)
parrot(spit):    key(esc)
# kuh: jump
parrot(kuh):     key(z)
# wince: right-click context menu
parrot(wince):   mouse_click(1)

# --- Camera ---
# whistle (continuous): toggle tactical camera at end of whistle
parrot(whistle:stop): key(o)
# motor (continuous mmmmm): rotate camera LEFT one notch per detection
parrot(motor): key(q)
# snore (continuous): rotate camera RIGHT one notch per detection
parrot(snore): key(e)

# Globals that still apply in BG3 (do NOT rebind here):
#   clop -> mouse_click(0)   (left click - move/interact)
#   tih  -> key(enter)       (confirm dialogs)
#   sss  -> scroll up        (zoom in)
#   shh  -> scroll down      (zoom out)
