# Nytimes::Events

A Ruby wrapper for the NYTimes Event Listings API.

## Installation

Add this line to your application's Gemfile:

    gem 'nytimes-events'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nytimes-events

## Usage

A simple usage example, as of right now:

    listing = Nytimes::Event::Listing.new(MY_API_KEY)
    listing.search('query' => 'food')

`search` takes a hash of parameters which directly correspond to the parameters found on the NYTimes' Event Listings API page. You must initialize any object with your API key which can be obtained from the NYTimes API website.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
