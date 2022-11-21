win.title: /(spec|test)(.js)|(.ts)/
-

test block <user.text>:
    content = user.formatted_text(text, "ALL_LOWERCASE")
    user.paste("""
    it('{content}', async () => {{

    }});""")

test sync block <user.text>:
    content = user.formatted_text(text, "ALL_LOWERCASE")
    user.paste("""
    it('{content}', () => {{

    }});""")

describe block <user.text>:
    content = user.formatted_text(text, "ALL_LOWERCASE")
    user.paste("""
    describe('{content}', () => {{

    }});""")

describe function block <user.text>:
    content = user.formatted_text(text, "PRIVATE_CAMEL_CASE")
    user.paste("""
    describe('{content}', () => {{

    }});""")