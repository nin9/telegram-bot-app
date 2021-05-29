# Telegram Bot App

## Setup

1- Copy .env.example to .env and add telegram bot token.

```shell
cp .env.example .env
```

2- Put the telegram bot token in the .env file.

3- Start the services.

```shell
docker-compose up
```

4- Create the databases.

```shell
docker-compose exec rails_app bundle exec rake db:create
```

5- Run the migrations.

```shell
docker-compose exec rails_app bundle exec rake db:migrate
```

6- Run the specs.

```shell
docker-compose exec rails_app bundle exec rspec
```

## Documentation

This app is run using docker in 2 modes rails server and telegram:bot:poller using this [gem](https://github.com/telegram-bot-rb/telegram-bot) (similar to sidekiq).

The **TelegramWebhooksController** acts as a listner for bot.getUdpates using polling, and _message_ method is called each time a user sends a message to the bot.

Action cable is used to make messages appear in realtime.
