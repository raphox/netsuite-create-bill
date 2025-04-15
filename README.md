# netsuite-create-bill

## Requirements

1. Ruby 3.3.4
2. Gems:
    - awesome_print
    - dotenv
    - netsuite

## Install dependencies

```
bundle install
```

## Environment variables (.env)

You can create an `.env` file to put the environment variables in, or you can set the environment variable in your environment.

```
NETSUITE_ACCOUNT=AB123456 <-- Change here, too
NETSUITE_CONSUMER_KEY=***
NETSUITE_CONSUMER_SECRET=***
NETSUITE_TOKEN_ID=***
NETSUITE_TOKEN_SECRET=***
```

## Executing the code

> **TID:** You can initialize a codespace to run this project. https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository

```
ruby main.rb
```