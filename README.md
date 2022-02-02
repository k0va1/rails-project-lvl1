![CI status](https://github.com/k0va1/rails-project-lvl1/actions/workflows/master.yml/badge.svg)

[![Actions Status](https://github.com/k0va1/rails-project-lvl1/workflows/hexlet-check/badge.svg)](https://github.com/k0va1/rails-project-lvl1/actions)

# HexletCode

Useful make commands:
* make install - install dependencies
* make lint - run rubocop
* make test - run test suite
* make ac - autocorrect rubocop offences(if possible)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  # Проверяет есть ли значение внутри name
  f.input :name
  # Проверяет есть ли значение внутри job
  f.input :job, as: :text
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
