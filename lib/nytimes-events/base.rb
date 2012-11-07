module Nytimes
  module Events
    class Base
      API_SERVER = 'api.nytimes.com'
      API_VERSION = 'v2'
      API_NAME = 'events'
      API_OBJECTS = 'listings'
      RESPONSE_TYPE = 'json'
      API_URL = "#{API_SERVER}/svc/#{API_NAME}/#{API_VERSION}/listings.#{RESPONSE_TYPE}"

      @@api_key = nil

      class << self
        def api_key=(key)
          @@api_key = key
        end

        def api_key
          @@api_key
        end
      end
    end
  end
end