# corelib_ruby

Many languages provide a vast library of methods or functions for developers to use, whereas Ruby only provides basic (albeit powerful) building blocks. At best, this leads to more complex applications and time wasted writing code another developer has probably already written; at worst it results in core class extensions being placed in helper methods or on objects that have no business owning the methods. The lack of a good strategy for managing Ruby extentions really becomes apparent when a developer needs to share his extensions across multiple projects.

Corelib aims to solve this problem by providing a central gem for developers to share extensions & additions to the Ruby core. Corelib focuses on:

1. Reducing Code Duplication
2. Improving Code Readability
3. Sharing Developer Knowledge
4. Reducing Errors
5. Saving Developers Time
6. Improving Code Quality & Performance

We invite all like minded developers to join us in growing the corelib library of extensions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'corelib_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install corelib_ruby

## Usage

Browse the `/lib/corelib_ruby/` directory to find new methods; each method provides extensive document.  All of these methods are now available inside your application without any additional configuration.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Open a console with either command

    $ bin/console
    $ rake console

Run rspec tests

    $ bin/rspec

Run rubocop

    $ bin/rubocop

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/corlewsolutions/corelib_ruby.

