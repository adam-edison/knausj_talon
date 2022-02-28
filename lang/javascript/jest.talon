win.title: /(spec|test)(.js)|(.ts)/
-

test block <user.text>:
    content = user.formatted_text(text, "ALL_LOWERCASE")
    user.paste("""
    it('{content}', async () => {{

    }});""")

describe block <user.text>:
    content = user.formatted_text(text, "ALL_LOWERCASE")
    user.paste("""
    describe('{content}', async () => {{

    }});""")