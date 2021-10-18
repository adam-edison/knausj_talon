mode: user.java
mode: command
and code.language: java
-
tag(): user.code_operators
tag(): user.code_generic
tag(): user.tabs

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
    user.paste("private final {className} {variable};")
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
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE,CONDENSED")
    user.paste("@Nested\n@DisplayName(\"{text}\")\nclass {className} {{\n\n}}")
    key(up:2)

when given <user.text>:
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE,CONDENSED")
    user.paste("@When @DisplayName(\"Given {text}\") class {className} {{")
    key(enter)

when when <user.text>:
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE,CONDENSED")
    user.paste("@When @DisplayName(\"When {text}\") class {className} {{")
    key(enter)

when and <user.text>:
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE,CONDENSED")
    user.paste("@When @DisplayName(\"and {text}\") class {className} {{")
    key(enter)

    
at before each:
    key(enter)
    insert("@BeforeEach")
    
at after each:
    key(enter)
    insert("@AfterEach")

before all:
    user.paste("@BeforeAll\nvoid setup() {{\n\n}}")
    sleep(20ms)
    key(up:2)
    sleep(20ms)
    key(end)
    sleep(20ms)
    key(enter)
    sleep(20ms)
    key(delete)

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
    
test that <user.text>:
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
    

print below:
    key(cmd-c)
    sleep(50ms)
    key(end)
    sleep(100ms)
    key(enter)
    sleep(100ms)
    insert("System.out.println(\"")
    sleep(10ms)
    edit.paste()
    sleep(10ms)
    insert(": \" + ")
    edit.paste()
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

suppress local field: "@SuppressWarnings(\"FieldCanBeLocal\")"

prepare <number> after <number>:
    edit.jump_line(number_1)
    sleep(100ms)
    key(end)
    sleep(100ms)
    key(shift-home)
    sleep(100ms)
    edit.cut()
    sleep(500ms)
    edit.jump_line(number_2)
    edit.line_end()
    sleep(20ms)
    key(enter)
    insert("@BeforeAll void prepare() {{ ")
    sleep(30ms)
    edit.paste()
    insert(" }}")
    sleep(20ms)
    key(end)
    key(enter)

cleanup <number> after <number>:
    edit.jump_line(number_1)
    sleep(100ms)
    key(end)
    sleep(100ms)
    key(shift-home)
    sleep(100ms)
    edit.cut()
    sleep(500ms)
    edit.jump_line(number_2)
    sleep(100ms)
    edit.line_end()
    sleep(20ms)
    key(enter)
    insert("@AfterAll void cleanup() {{ ")
    sleep(30ms)
    edit.paste()
    insert(" }}")
    sleep(20ms)

param event type:
    user.paste("@ParameterizedTest(name = \"with event type of {{0}}\")")

collect test info:
    user.paste("""@AfterEach
    void collectTestInfo(TestInfo testInfo, TestReporter testReporter) {{
        conditions.addGiven(testInfo.getDisplayName());
        testReporter.publishEntry(conditions.toString());
        conditions.removeLastGiven();
    }}
    """)

collect test info short:
    user.paste("""@AfterEach
    void collectTestInfo(TestReporter testReporter) {{
        testReporter.publishEntry(conditions.toString());
    }}
    """)

outcome then <user.text>:
    user.paste("conditions.addOutcome(\"Then {text}\");")
    sleep(100ms)
    key(left:3)

condition when <user.text>:
    user.paste("conditions.addCondition(\"When {text}\");")
    sleep(100ms)
    key(left:3)

outcome and <user.text>:
    user.paste("conditions.addOutcome(\"and {text}\");")
    sleep(100ms)
    key(left:3)

replace outline:
    key(end)
    sleep(100ms)
    key(shift-home)
    sleep(100ms)
    user.paste("conditions = new TestOutline(\"Given a PointClickCare webhook event\");")