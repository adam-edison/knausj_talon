go <user.arrow_keys>: key(arrow_keys)
<user.letter>: key(letter)
(ship | uppercase) <user.letters>:
    user.insert_formatted(letters, "ALL_CAPS")
<user.symbol_key>: key(symbol_key)
<user.function_key>: key(function_key)
<user.special_key>: key(special_key)
<user.modifiers> <user.unmodified_key>: key("{modifiers}-{unmodified_key}")

# keys with punctuation
hyphen: insert(" - ")
stop: insert(". ")
spamma: insert(" ,")
spam: insert(", ")
stamp: insert(": ")
becomes: insert(" -> ")