require 'rest_client'
require 'json'

require 'nytimes-events/base'
require 'nytimes-events/events'
require 'nytimes-events/version'

module Nytimes
  module Events
    class Error < StandardError; end
  end
end
