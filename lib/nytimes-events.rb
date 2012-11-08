require 'rest_client'
require 'json'

require 'nytimes-events/base'
require 'nytimes-events/list'
require 'nytimes-events/version'

module Nytimes
  module Events
    class Error < StandardError; end
  end
end
