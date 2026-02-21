app: iterm2
mode: command
-
# entries
parrot(clop): key(enter)
parrot(puh):  key(tab)

# clear
parrot(motor:stop): insert("/clear\n")
parrot(whistle:stop): insert("clear\n")

# navigation
parrot(kuh):  key(tab)
parrot(tih):  user.cycle_tabs()