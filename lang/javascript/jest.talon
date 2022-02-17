win.title: /(.js)|(.ts)/
-

write test <user.text>:
    content = user.formatted_text(text, "ALL_LOWERCASE")
    user.paste("""
    it('{content}', async () => {{

    }});""")
