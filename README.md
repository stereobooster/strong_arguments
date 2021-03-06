# strong_arguments

**Work in progress.**

## Intorduction

strong_arguments - like [strong_parameters](https://github.com/rails/strong_parameters) but for method arguments. [Read blogpost for more info](http://stereobooster.github.io/story-behind-strong-arguments).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'strong_arguments'
```

And then execute:

    $ bundle

## Usage

```ruby
require 'strong_arguments'

def where(options = {})
  arguments = StrongArguments.new(options)
    .optional(:name, :age)

  if argument.name_present?
    argument.name
  elsif argument.age_present?
    argument.age
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/stereobooster/strong_arguments. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

