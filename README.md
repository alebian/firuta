# Firuta
[![Gem Version](https://badge.fury.io/rb/firuta.svg)](https://badge.fury.io/rb/firuta)
[![Dependency Status](https://gemnasium.com/alebian/firuta.svg)](https://gemnasium.com/alebian/firuta)
[![Build Status](https://travis-ci.org/alebian/firuta.svg)](https://travis-ci.org/alebian/firuta)
[![Code Climate](https://codeclimate.com/github/alebian/firuta/badges/gpa.svg)](https://codeclimate.com/github/alebian/firuta)
[![Test Coverage](https://codeclimate.com/github/alebian/firuta/badges/coverage.svg)](https://codeclimate.com/github/alebian/firuta/coverage)
[![Inline docs](http://inch-ci.org/github/alebian/firuta.svg)](http://inch-ci.org/github/alebian/firuta)

This gem helps you manage actions with collections in a chainable way. The idea is that you use your favorite collection actions like filter or map with procs, blocks or lambdas that receive one or more parameters. Also you get a paginate method for free ;)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'firuta'
```

Or install it yourself as:

    $ gem install firuta

## Usage

After installing the gem, you can use it anywhere:

```ruby
require 'firuta'

# First define your reusable procs or lambdas
BETWEEN = ->(element, min, max) { element > min && element < max }
MULTIPLY_BY = ->(element, number) { element * number }
NATURAL_SORT = ->(x, y) { x <=> y }
IDENTITY = ->(element) { element }

# Then create a collection to apply your actions
collection = [10, 2, 3, 4, 5, 1, 10, -1]

# Then define your reusable applier
applier = Firuta.new
                .filter(BETWEEN, with: [0, 10])
                .map(MULTIPLY_BY, with: 3)
                .sort(NATURAL_SORT)
                .uniq(IDENTITY)

# Finally apply your actions
puts applier
       .apply(collection)
       .to_s #=> [3, 6, 9, 12, 15]

# Then you can change the collection and reuse everything
collection = [100, 2, 30, 4, -5, 1, 10, -1]

puts applier
       .apply(collection)
       .to_s #=> [3, 6, 12]

# Also paginate the collection
puts applier
      .paginate(with: { page: 1, page_size: 2 })
      .apply(collection)
      .to_s #=> [12]
```

## Actions

All the Firuta actions can receive parameters and blocks in different ways. You can use Procs or lambdas, choose the one you like the most:

```ruby
collection = [1, 2, 3]

EXAMPLE_LAMBDA = ->(element, a, b, c) { element }
PARAMS = ['a', 'b', 'c']

puts Firuta.new
           .filter(EXAMPLE_LAMBDA, PARAMS)
           .filter(EXAMPLE_LAMBDA, with: PARAMS)
           .filter(function: EXAMPLE_LAMBDA, with: PARAMS)
           .filter(with: PARAMS) { |element, a, b, c| element }
           .apply(collection)
           .to_s #=> [1, 2, 3]
```

The `find` and `reduce` actions are considered final (because they transform the collection into something else). Those actions need to be defined at the end of the chain or else an exception will be raised.

```ruby
require 'firuta'

BETWEEN = ->(element, min, max) { element > min && element < max }
REDUCER = ->(acc, element) { acc + element }

collection = [10, 2, 3, 4, 5, 1, 10, -1]

puts Firuta.new
           .filter(BETWEEN, with: [0, 10])
           .reduce(REDUCER, with: 0)
           .apply(collection) #=> 15

begin
  puts Firuta.new
             .reduce(REDUCER, with: 0)
             .filter(BETWEEN, with: [0, 10]) # Raises
             .apply(collection)
rescue Firuta::Errors::MoreThanOneTerminalCommand => e
  puts e #=> Firuta::Errors::MoreThanOneTerminalCommand
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run rubocop lint (`rubocop -R lib spec --format simple`)
5. Run rspec tests (`bundle exec rspec`)
6. Push your branch (`git push origin my-new-feature`)
7. Create a new Pull Request
