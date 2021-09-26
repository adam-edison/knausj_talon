mode: user.java
mode: command
and code.language: java
-
tag(): user.code_operators
tag(): user.code_generic
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
