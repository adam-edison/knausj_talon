win.title: /(.test.js)|(.spec.ts)/
_
new test class <user.text>:
    className = user.formatted_text(text, "PUBLIC_CAMEL_CASE")
    user.paste("""
    const {{ {className} }} = require('./{className}');
    const {{ expect }} = require('chai');\n
    describe('{className}', function () {{
        describe('#functionMethod', function () {{
            describe('when context', function () {{
                it('does something', async function () {{
                    const actual = await calculate();
                    expect(actual).to.equal(expected);
                }});
            }});
        }});
    }});""")

expect sink <user.text>:
    user.paste("""
    it('{text}', function () {{
        const actual = calculate();
        expect(actual).to.equal(4);
    }});""")

async test <user.text>:
    user.paste("""
    it('{text}', async () => {{
        const actual = await calculate();
        expect(actual).to.equal(4);
    }});""")

^test <user.text>$:
    user.paste("""
    it('{text}', function () {{
        // do something
        expect(actual).to.equal(expected);
    }});""")

async before each:
    user.paste("""
    beforeEach(async function () {
        const actual = await calculate();
    });""")

before each:
    user.paste("""
    beforeEach(function () {
        const actual = calculate();
    });""")

async after each:
    user.paste("""
    afterEach(async function () {
        const actual = await calculate();
    });""")

after each:
    user.paste("""
    afterEach(function () {
        const actual = calculate();
    });""")

describe when <user.text>:
    user.paste("""
    describe('when {text}', () => {{
    \t
    }});""")
    key(home)
    key(up)
    key(end)

describe <user.text>:
    user.paste("""
    describe('{text}', () => {{
    \t
    }});""")
    key(home)
    key(up)
    key(end)

surround describe block:
    edit.cut()
    sleep(100ms)    
    user.paste("describe('when context', function () {\n")
    sleep(100ms)
    edit.paste()
    user.paste("\n});")