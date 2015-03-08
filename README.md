# Slackbotsy example

This is an example deployment of
[slackbotsy](https://github.com/rlister/slackbotsy), using sinatra to
listen to an outgoing webhook on [Slack](https://slack.com/).

There are some example scripts and helpers to get you up and running
with your new ruby bot.

## Install

```sh
$ git clone https://github.com/rlister/slackbotsy_example.git
$ bundle install
```

## Test running the code

Run the server in one window:

```sh
$ OUTGOING_TOKEN=123 bundle exec shotgun
```

and in another window run a test query to botsy:

```sh
$ OUTGOING_TOKEN=123 bin/test botsy ping
{"text":"pong"}
```

Congratulations, botsy replied to you. Botsy will only respond to
messages with a matching `OUTGOING_TOKEN`.

## Test sending data to slack

Setup an Incoming Webhook in Slack:

- go to https://your_team.slack.com/services/new
- add Incoming Webhook, choose default channel in which you would like
  botsy to post (this will be overridden per message later)
- copy the URL from the integration; it will look something like:
  `https://hooks.slack.com/services/NOQU9ISI6/YAIJIECH4/DISHEINGOHYAE6AHNG3PIEK6`

Re-run the server with _your_ incoming webhook:

```sh
$ INCOMING_WEBHOOK=https://hooks.slack.com/services/NOQU9ISI6/YAIJIECH4/DISHEINGOHYAE6AHNG3PIEK6 \
OUTGOING_TOKEN=123 \
bundle exec shotgun
```

and test botsy's `say` command:

```sh
$ OUTGOING_TOKEN=123 bin/test botsy say hello world
{"text":""}
```

This time botsy didn't return a response, but should have posted `hello world`
to the default channel you configured for your incoming webhook. If nothing
appeared, check your webhook is correct.

## Test receiving data from slack

To receive data, your botsy will need to be listening on a
publically-accessible port. Either run this on a public server, or
setup some local tunnel, for example using https://ngrok.com/.

Setup at least one outgoing webhook:

- go to https://your_team.slack.com/services/new
- add Outgoing Webhook:
- choose a channel for botsy to listen
- add your URL for botsy (for example your ngrok forwarding URL)
- copy the outgoing token (which will look something like `Vupohshohj5xeTee3ohthe6n`)

Run the botsy server with your outgoing token:

```sh
$ INCOMING_WEBHOOK=https://hooks.slack.com/services/NOQU9ISI6/YAIJIECH4/DISHEINGOHYAE6AHNG3PIEK6 \
OUTGOING_TOKEN=Vupohshohj5xeTee3ohthe6n \
bundle exec shotgun
```

Now type `botsy ping` into the channel you chose above, and botsy
should respond in the channel.

## Multiple channels

You must choose between having botsy listen to all channels with a
trigger word, or listen to all messages in a specific channel. To
listen to all messages in multiple channels you can add a separate
outgoing webhook for each channel, and pass all tokens to botsy as a list:

```
OUTGOING_TOKEN=Vupohshohj5xeTee3ohthe6n,Cupai9viQuaexi6ohPhahrie
```

## Deploy to Heroku

```sh
$ heroku login
$ heroku create
Created http://mystic-wind-83.herokuapp.com/ | git@heroku.com:mystic-wind-83.git
$ git push heroku master
$ heroku config:set OUTGOING_TOKEN=Vupohshohj5xeTee3ohthe6n
$ heroku config:set INCOMING_WEBHOOK=https://hooks.slack.com/services/NOQU9ISI6/YAIJIECH4/DISHEINGOHYAE6AHNG3PIEK6
```

Now create your Outgoing Webhook as described above, using your new
herokuapp URL.

## Deploy with Docker

Coming soon.
