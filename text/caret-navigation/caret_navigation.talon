mode: command
-

# TODO: AGE: figure out how to concatenate the list of letters and characters so that we can have one list and not duplicate these commands

trap {user.pair_symbols}:
    user.caret_select_between(user.pair_symbols)

pre <user.letters>:
    user.caret_before(user.letters)

pre word <user.text>:
    user.caret_before(text)

pre <user.letters> <number>:
    user.caret_before(user.letters, number)

pre <user.letters> last:
    user.caret_before(user.letters, 0)

pre <user.symbol_key>:
    user.caret_before("\{user.symbol_key}")

pre <user.symbol_key> <number>:
    user.caret_before("\{user.symbol_key}", number)

pre <user.symbol_key> last:
    user.caret_before("\{user.symbol_key}", 0)

post <user.letters>:
    user.caret_after("{user.letters}")

post <user.letters> <number>:
    user.caret_after("{user.letters}", number)

post <user.letters> last:
    user.caret_after("{user.letters}", 0)

post <user.symbol_key>:
    user.caret_after("\{user.symbol_key}")

post <user.symbol_key> <number>:
    user.caret_after("\{user.symbol_key}", number)

post <user.symbol_key> last:
    user.caret_after("\{user.symbol_key}", 0)