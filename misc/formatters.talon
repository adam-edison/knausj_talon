#provide both anchored and unachored commands via 'over'
# (say|write) <user.text>$: user.insert_formatted(text, "NOOP")
# (say|write) <user.text> over: user.insert_formatted(text, "NOOP")

{user.prose_formatter} <user.prose>$: user.insert_formatted(prose, prose_formatter)
{user.prose_formatter} <user.prose> (over|fin): user.insert_formatted(prose, prose_formatter)

{user.prose_formatter} <user.prose> wit: 
    user.insert_formatted(prose, prose_formatter)
    insert(" ")

{user.prose_formatter} <user.prose> period: 
    user.insert_formatted(prose, prose_formatter)
    insert(". ")

{user.prose_formatter} <user.prose> waver: 
    user.insert_formatted(prose, prose_formatter)
    insert(", ")

<user.format_text>+$: user.insert_many(format_text_list)
<user.format_text>+ (over|fin): user.insert_many(format_text_list)
<user.formatters> that: user.formatters_reformat_selection(user.formatters)
word <user.word>: user.insert_formatted(user.word, "NOOP")
format help | help format: user.formatters_help_toggle()
recent list: user.toggle_phrase_history()
recent repeat <number_small>: insert(user.get_recent_phrase(number_small))
recent copy <number_small>: clip.set_text(user.get_recent_phrase(number_small))
select that: user.select_last_phrase()
nope that | scratch that: user.clear_last_phrase()
nope that was <user.formatters>: user.formatters_reformat_last(formatters)
format recent: user.formatters_recent_toggle()
format repeat <number>: 
  result = user.formatters_recent_select(number)
  insert(result)
format copy <number>:
  result = user.formatters_recent_select(number)
  clip.set_text(result)

yell <user.text>:
  result = user.formatted_text(text, "ALL_CAPS")
  insert(result)

constant <user.text>: 
  result = user.formatted_text(text, "ALL_CAPS,SNAKE_CASE")
  insert(result)

^<number> by <number>$:
  insert("{number_1} x {number_2}")

^code word:
  key(alt-left)
  insert("`")
  key(alt-right)
  sleep(100ms)
  insert("`")

# TODO: AGE: move this to a markdown context tag?
clip link <user.text>:
  insert("[{user.text}]")
  insert("(")
  edit.paste()
  sleep(200ms)
  insert(")")
