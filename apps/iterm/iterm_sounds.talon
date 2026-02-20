app: iterm2
mode: command
-
# entries
parrot(clop): key(enter)
parrot(puh):  insert("1\n")

# clear
parrot(motor:stop): insert("/clear\n")
parrot(whistle:stop): insert("clear\n")

# navigation
parrot(kuh):  user.jump_to_primary()
parrot(tih):  user.cycle_to_next_secondary()