os: mac
-

# TODO: AGE split out into javascript, java, markdown language files which should already exist
(boolean | boullion): "boolean"
constant: "const "
equal to: " = "
not equal to: " != "
points to: " --> "
equals new: " = new "

new class <user.text>:
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("""class {className} {{
    \n
    }}
    \n
    module.exports = {{ {className} }};""")

new constructor:
    user.paste("""constructor({}) {
        Object.assign(this, {});
    }""")
    key(up)
    key(end)
    key(left)
    key(left)

export class <user.text>:
    key(cmd-end)
    key(enter)
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("module.exports = {")
    user.paste("{className}")
    user.paste("};")

export this:
    edit.copy()
    key(cmd-end)
    key(enter)
    key(enter)
    insert("module.exports = { ")
    edit.paste()
    insert(" };")

error dot message:
    insert("error.message")

arrow function <user.text> over:
    result = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    insert("const ")
    insert(result)
    insert(" = () => {")
    key(enter)

require <user.text> over:
    result = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    insert("const { ")
    insert(result)
    insert(" } = require('');")
    key(left)
    key(left)
    key(left)
    insert("../")

arrow function:
    insert(" = () => {}")
    key(left)

console log <number> below:
    key(cmd-c)
    edit.jump_line(number)
    key(end)
    sleep(100ms)
    key(enter)
    insert("console.log('")
    key(cmd-v)
    insert("', ")
    key(cmd-v)
    insert(");")

console log above:
    key(cmd-c)
    key(up)
    sleep(100ms)
    key(end)
    sleep(100ms)
    key(enter)
    insert("console.log('")
    key(cmd-v)
    insert("', ")
    key(cmd-v)
    insert(");")
    
console log below:
    key(cmd-c)
    key(end)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert("console.log('")
    key(cmd-v)
    insert("', ")
    key(cmd-v)
    insert(");")

console log <user.text>:
    insert("console.log('{text}');")

log debug below:
    key(cmd-c)
    key(end)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert("log.debug(")
    insert("\"")
    key(cmd-v)
    insert("\"")
    insert(");")

this log error: "this.log.error("
this log info: "this.log.info("
this log warn: "this.log.warn("
this log debug: "this.log.debug("

new checkbox:
    insert("[ ] ")

# TODO: AGE, copy line, search for [ ] and change to [x], and paste it back in, instead
# that will combine these two methods into one
# and it will allow it to work on browsers or editors that don't have indentation awareness with that HOME key

# TODO: AGE, microphone off as keyboard shortcut (as well )

check box:
    key(home)
    sleep(50ms)
    key(right)
    sleep(50ms)
    key(delete)
    sleep(50ms)
    insert("x")

task here:
    key(home)
    sleep(20ms)
    insert("* [ ] ")

next task [<user.text>]:
    result = text or ''
    key(end)
    sleep(100ms)
    key(enter)
    insert("* [ ] ${result}")

child task:
    key(end)
    sleep(100ms)
    key(enter)
    key(tab)
    insert("* [ ] ")

parent task:
    key(end)
    sleep(100ms)
    key(enter)
    key(shift-tab)
    insert("* [ ] ")

(shift|unindent) <number> over:
    key(home)
    key(home)
    sleep(100ms)
    key(shift-down)
    repeat(number - 1)
    key(shift-tab)

(slide|indent) <number> over:
    key(home)
    key(home)
    sleep(100ms)
    key(shift-down)
    repeat(number - 1)
    key(tab)

complete <number>:
    user.switcher_focus("sublime")
    sleep(300ms)
    edit.jump_line(number)
    sleep(50ms)
    edit.line_end()
    edit.line_start()
    key(right)
    key(right)
    key(right)
    key(delete)
    insert("x")
    key(cmd-s)
    sleep(200ms)
    key(escape)

member: "this."

# TODO: extract these as python functions for reference and use them in javascript and java commands
new <user.text> instance: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("const {variable} = new {className}();")
    key(left)
    key(left)

throw exception <user.text>$:
    result = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("throw new {result}();")

member equals <user.text>: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    user.paste("this.{variable} = {variable};")
    key(left)
    key(left)

member equals object <user.text>: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    user.paste("this.{variable} = object.{variable};")
    key(left)
    key(left)

doc wrapper:
    user.paste("@param {{object}} object - generic wrapper")
object dot:
    user.paste("object.")


to do age [<user.text>]:
    content = text or ""
    insert("// TODO: AGE: {content}")

to do [<user.text>]:
    content = text or ""
    insert("// TODO: {content}")

assign this:
    insert("this.")
    key(cmd-v)
    insert(" = object.")
    key(cmd-v)
    insert(";")

new method <user.text> over:
    methodName = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    user.paste("""{methodName}() {{\n
    }}""")
    sleep(200ms)
    key(up)
    key(up)
    key(end)
    key(left)
    key(left)
    key(left)

empty string:
    user.paste("''")

return empty string:
    user.paste("return '';")

empty dubstring:
    user.paste("""""")

throw: "throw "

this auto set <user.text>:
    insert("this.set")
    insert("{text}")
    sleep(200ms)
    key(ctrl-space)

care branch: "point-click-care-feature"

my name: "Adam Edison"
my first [name]: "Adam"
my last [name]: "Edison"

# TODO: figure out how to make "Find All <text>" an edit shortcut that all apps can override
search talon <user.text>:
    user.switcher_focus("code")
    sleep(200ms)
    key(cmd-shift-f)
    sleep(50ms)
    insert(text)
    sleep(50ms)
    key(enter)