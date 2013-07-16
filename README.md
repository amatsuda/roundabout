# Roundabout

A Rails Engine that generates a page transition diagram for your Rails app.


## Requirements

- Ruby 1.9 or 2.0

- Rails 3 or 4

- RSpec 2

- Capybara 1 or 2


## Installation

Add this line to your Rails app's Gemfile:

```ruby
  gem 'roundabout'
```

And execute:

```bash
% bundle
```

Then add this line to your `spec/spec_helper.rb`:

```ruby
require 'roundabout/rspec'
```


## Usage

Firstly, run the whole test (I suppose parallel spec is not supported ATM)

```bash
% rake spec
```

Then browse at your `http://localhost:3000/roundabout`


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Team

* [Akira Matsuda](https://github.com/amatsuda)
* [Teppei Machida](http://github.com/machida)
