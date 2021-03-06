# freefeed-client

Ruby wrapper for [Freefeed API](https://fetsh.github.io/freefeed-api).

[![Gem Version](https://badge.fury.io/rb/freefeed-client.svg)](https://badge.fury.io/rb/freefeed-client)

## Installation

Add following line to your Gemfile:

```ruby
gem 'freefeed-client'
```

And then execute:

```shell
$ bundle
```

Or install it system-wide:

```shell
$ gem install freefeed-client
```

## Usage

First things first, you need to [obtain a token](https://fetsh.github.io/freefeed-api/#authentication) for your user. Then create your api client like this:

```ruby
require 'freefeed'

client = Freefeed::Client.new('yourFreefeedAPIToken')

post = Freefeed::Types::PostCreate.new(
  {
    post: { 
      body: 'Hello World!'
    },
    meta: {
      feeds: ['yourusername']
    }
  }
)

Freefeed::Post.create(client, post)
```

You can achive the same result without addressing `Freefeed::Post` class directly:

```ruby
require 'freefeed'

client = Freefeed::Client.new('yourFreefeedAPIToken')

post = Freefeed::Types::PostCreate.new(
  {
    post: { 
      body: 'Hello World!'
    },
    meta: {
      feeds: ['yourusername']
    }
  }
)

client.posts_create(post)
```

You can even skip instantiating `PostCreate` type, but you will lose some validation:


```ruby
require 'freefeed'

client = Freefeed::Client.new('yourFreefeedAPIToken')

client.posts_create({post: {body: 'Hello World!'}, meta: {feeds: ['yourusername']}})
```

## Logging

By default, `freefeed-client` logs everything to STDOUT. You can change this behavior and provide your own logger class with some options. See example below:

```ruby
client = Freefeed::Client.new(
  'yourFreefeedAPIToken',
  logger: Logger.new('log.txt'),
  logger_options: {bodies: false, headers: false}
)
```
