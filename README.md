# Railsbytes CLI

This Gem is a proof-of-concept CLI to apply [Railsbytes.com](https://railsbytes.com) templates to your Rails application.


## Installation

Install it with:

    $ gem install railsbytes

## Usage

    $ railsbytes install NAME

Where `NAME` is the template you want to search for on Railsbytes.com.

### Example

This example would apply the tailwind template to your Rails application:

    $ railsbytes install tailwind

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcoroth/railsbytes.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
