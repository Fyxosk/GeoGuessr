# GeoGuessr challenge generator

With this simple app you can generate as many GeoGuessr challenges as you want (given you have a premium account).

## Dependencies

Python:
- Version >= 3.6
- Discord
- Selenium
- Requests
- [geckodiver](https://github.com/mozilla/geckodriver/releases) somewhere in your path (for example /usr/bin)

```
pip install -r requirements.txt
```

Discord:
- An [app](https://discord.com/developers/applications) (and a bot).
- A server ready to welcome your Bot.

GeoGuessr:
- A premium account (only 25€/yr).

Documentation (optional):
- sphinx `pip3 install sphinx`
- a nice theme `pip3 install sphinx_rtd_theme`

To generate the documentation type `make doc` at the root of the project.

## Commands

A command is the combination of two methods `handle` and `usage` (see CommandExample.py).
To add a new command, add a new `MyCommand.py` in the commands directory with the same format
as the one described in CommandExample.py.

## Issues

### Properly setting your bot TOKEN

In `BotGeoguessr.py` you can find a line reading `TOKEN = os.environ["GEOGUESSR_TOKEN"]`. 
For this line to make any sense, you have to have an environment variable with this name.
If you don't want to use an environment variable, just set `TOKEN = "your_token"`. You can find it
[here](https://discord.com/developers/applications).

### Linking your GeoGuessr account

In `Utils.py` there are two lines `mail = os.environ["MAIL"]` (can be set via command line with the flag `-u`) and `password = os.environ["PASSWD"]`.Same idea as with the TOKEN, either set environment variables, or just replace both fields with both your mail and password. Finally, set login method below `login_method = LoginMethod.GOOGLE` (can be set via command line with the flag `-lm`) to whatever you use (you can find the list in LoginMethod.py).

### Browsing context has been discarded

If you ever encounter this error, reboot the bot and wait a bit (like 30 seconds) before using it.

### Google sign in fails

If you can't sign in your geoguessr account using Google, then you will have to switch your account type (send a mail to the GeoGuessr team, they'll switch you account to a normal GeoGuessr account in less than a day). This happens because Google tries to limit automatic login as much as possible (probably in an effort to fight against spam bots). Note that before changing your login method you should make sure this is the issue by debugging as explained below.

### Another issue?

Make sure everything is up-to-date and then raise it! To raise an issue, you can pre-debug by yourself to help me figure the issue out. To do so, go in `BotGeoguessr.py` and set the line `options.headless = True` to False and then restart the bot (make sure to be on a computer with a graphical interface!). That way, you will be able to pinpoint the exact moment when the bot fails.
