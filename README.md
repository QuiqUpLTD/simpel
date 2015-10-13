# Simpel

This is an experimental alternative to Active Model Serializers. It allows attribute and association extraction using
a simple DSL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simpel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simpel

## Usage

```ruby
Simpel.define do
  root :book do
    attributes :title, :year
    methods :buy, :read

    has_one :author do
      attributes :first_name, :last_name
      methods :write_book, :publish_book
    end

    has_many :pages do
      attributes :number, :body
      methods :write_book, :publish_book
    end
  end
end

Simpel.serialize(a_book, :book)
```

## Limitations
Each time you change a simpel serializer, you need to restart Rails.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/simpel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
