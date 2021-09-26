from talon import ui, actions, cron, speech_system, app

job = None

def on_phrase(j):
    global job
    if j.get('phrase'):
        cron.cancel(job)
        job = cron.after('30m', actions.speech.disable)

speech_system.register('post:phrase', on_phrase)

def on_ready():
    global job
    if actions.speech.enabled():
       job = cron.after('15m', actions.speech.disable)

app.register("ready", on_ready)

# https://github.com/nriley/knausj_talon/blob/nriley/misc/screen.py

#ui.register('screen_sleep', lambda e: actions.speech.disable())
#ui.register('screen_wake', lambda e: app.notify('Make sure you are wearing your back brace'))