# Welcome to SpreeGiftWrapping extension

This project is spree plugin for gift wrapping option when checkout order.
This project rocks and uses MIT-LICENSE.

## Requirements

rails 3.2.x
spree 1.3.x
tested with (spree 1.3.x, rails 3.2.13)

## Getting started
You can add this gem into your Gemfile with:
```ruby
gem 'spree_gift_wrapping', :github => 'xmpolaris/spree_gift_wrapping'
```
Run the bundle command to install it.
After you install gem and add it to your Gemfile, you need to run the generator:
```console
rails generate spree_gift_wrapping:migration
```
The generator will create migration files for spree_gift_wrapping gem.
```console
rails generate spree_gift_wrapping:migration
```
When you are done, you have to run migration task.
```console
bundle exec rake db:migrate
```

Done.

## TODO
Testing spec.



