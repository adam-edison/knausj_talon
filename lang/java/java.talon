mode: user.java
mode: command
and code.language: java

-
tag(): user.code_operators
tag(): user.code_generic

action(user.code_operator_indirection): skip()
action(user.code_operator_address_of): skip()
action(user.code_operator_lambda): " -> "
action(user.code_operator_subscript): 
	insert("[]")
	key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_exponent): " ^ "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " && "
action(user.code_operator_or): " || "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_self): "this"
action(user.code_null): "null"
action(user.code_is_null): " == null"
action(user.code_is_not_null): " != null"
action(user.code_state_if): 
    insert("if () ")
    key(left)
    key(left)
action(user.code_state_else_if): 
    insert("else if () ")
    key(left)
	key(left)
action(user.code_state_else): 
	insert("else ")
	key(enter)
action(user.code_state_switch):
    insert("switch () ") 
    key(left)
	edit.left()
action(user.code_state_case):
	insert("case \nbreak;") 
	edit.up()
action(user.code_state_for):
    insert('for () ')
    key(left)
    key(left)
action(user.code_state_while): 
    insert("while () ")
    edit.left()
	edit.left()
action(user.code_type_class): "class "
action(user.code_private_function):
	insert("private")
action(user.code_protected_function):
    user.code_private_function()
action(user.code_public_function):
	insert("public ")
action(user.code_state_return):
    insert("return ")

# TODO: AGE: extract most of these into reusable functions
# TODO: AGE: JUnit 5 test file snippet "new test file"
# TODO: AGE: JUnit 5 big "^when <user.text> then <user.text>"
# TODO: AGE: JUnit 5 big "^when <user.text>"
# TODO: AGE: JUnit 5 big "^and then <user.text>"
# @Nested, @BeforeEach, @AfterEach, @Test, @DisplayName -- all of it should be handled here

mock private <user.text>:
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("@Mock\n")
    user.paste("private {className} {variable};")
    key(left)
    key(left)
    insert("private {result}")

instance <user.text>: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("{className} {variable} = new {className}();")
    key(left)
    key(left)


(argument|variable) <user.text>: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("{className} {variable}")

comment here:
    insert("// ")

autowired:
    key(home)
    sleep(100ms)
    key(enter:2)
    sleep(100ms)
    key(up)
    insert("@Autowired")

argument <user.text>:
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("{className} {variable}")

private <user.text>: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("private {className} {variable};")
    key(left)
    key(left)

private final <user.text>: 
    variable = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("private final {className} {variable} = new {className}();")
    key(left)
    key(left)

equals (null|no):
    insert(" == null")

at integration test:
    insert("@ConfigureIntegrationTest")

at test:
    insert("@Test")

at nested:
    key(enter)
    insert("@Nested")

at display name:
    insert("@DisplayName(\"\")")
    key(left:2)

at inject mocks:
    insert("@InjectMocks")

simple nested <user.text>:
    classNamePart = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("@Nested\n@DisplayName(\"{text}\")\nclass {classNamePart} {{\n\n}}")
    key(up:2)

nested <user.text>:
    classNamePart = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("@Nested\n@ConfigureIntegrationTest\n@DisplayName(\"{text}\")\nclass {classNamePart} {{\n\n}}")
    key(up:2)

at before each:
    key(enter)
    insert("@BeforeEach")

at after each:
    key(enter)
    insert("@AfterEach")

before each:
    user.paste("@BeforeEach\nvoid setup() {{\n\n}}")
    sleep(20ms)
    key(up:2)
    sleep(20ms)
    key(end)
    sleep(20ms)
    key(enter)
    sleep(20ms)
    key(delete)

after each:
    user.paste("@AfterEach\nvoid cleanup() {{\n\n}}")
    key(up:2)
    key(end)
    key(enter)
    key(delete)

after all:
    user.paste("@AfterAll\nvoid tearDown() {{\n\n}}")

test <user.text>:
    methodName = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    user.paste("@Test\n@DisplayName(\"{text}\")\nvoid {methodName}() {{\n\n}}")
    key(up:3)
    key(end)
    sleep(200ms)
    key(left:2)

string <user.text>: 
    variableName = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    insert("String {variableName}")

integer <user.text>: 
    variableName = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    insert("Integer {variableName}")

assign: insert(" = ")

string format:
    insert("String.format()")
    key(left)

assert exception contains:
    insert("assertThat(exception.getMessage(), containsString(\"\"));")
    key(left:4)

assert <user.text> exception:
    exceptionClass = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    insert("Exception exception = assertThrows({exceptionClass}Exception.class, () -> {")
    insert("\n\n}")
    key(up)

print clip:
    key(cmd-c)
    key(end)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert("System.out.println(")
    insert("\"")
    key(cmd-v)
    insert(": \" + ")
    key(cmd-v)
    insert(");")

print <user.text>:
    key(end)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert("System.out.println(\"{text}\");")

optional:
    insert("Optional<> ")
    key(left:2)

camel <user.text> bean:
    print("triggered")
    input = text + " bean"
    result = user.formatted_text(input, "PRIVATE_CAMEL_CASE")
    insert(result)

at getter: "@Getter"
at setter: "@Setter"
at to string: "@ToString"
at component: "@Component"

append <user.text>: 
    variableName = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    key(end)
    key(enter)
    insert(".append({variableName}, other.{variableName})")

class hash code: "return getClass().hashCode();"
id equality: "return id != null && id.equals(other.id);"

equals method:
    user.paste("""
    @Override
    public boolean equals(Object obj) {

        if (this == obj) {
            return true;
        }

        if (obj == null) {
            return false;
        }

        if (getClass() != obj.getClass()) {
            return false;
        }

        if (id == null) {
            return false;
        }

        CampusCustomDataEntity other = (CampusCustomDataEntity) obj;
        return id.equals(other.id);
    }
    """)

hash code method:
    user.paste("""
    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
    """)



getter setter to string:
    insert("@Getter")
    sleep(1000ms)
    key(enter)
    sleep(200ms)
    key(enter)

    insert("@Setter")
    sleep(1000ms)
    key(enter)
    sleep(200ms)
    key(enter)

    insert("@ToString")
    sleep(1000ms)
    key(enter)
    sleep(200ms)
    key(enter)