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

    listing = Nytimes::Event::List.new(MY_API_KEY)
    listing.find('query' => 'food')

`search` takes a hash of parameters which directly correspond to the parameters found on the NYTimes' Event Listings API page. You must initialize any object with your API key which can be obtained from the NYTimes API website.

**IMPORTANT**

`nytimes-event` is based off of the linked-list data structure. That is, `Nytimes::Event::List` actually retrieves `batch_size` number of events, and you can retrieve the next `batch_size` events or the previous `batch_size` events.

`batch_size` by default is 20.

For example:

    listing = Nytimes::Event::List.new(MY_API_KEY)
    listing.batch_size = 10
    listing.find('query' => 'food')
    #=> next retrieves the next 10 events
    listing.next
    #=> previous retrieves the previous 10 events
    listing.prev

Also, you can reset to head (such that the results are those which would appear if you hadn't called next or previous at all) by calling `to_head`:

    listing.to_head

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
