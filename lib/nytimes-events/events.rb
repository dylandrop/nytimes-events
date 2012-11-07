module Nytimes
  module Events
    class Base
      API_SERVER = 'api.nytimes.com'
      API_VERSION = 'v2'
      API_NAME = 'events'
      API_OBJECTS = 'listings'
      API_BASE = "/svc/#{API_NAME}/#{API_VERSION}/listings"

      @@api_key = nil

      class << self
        def api_key=(key)
          @@api_key = key
        end

        def api_key
          @@api_key
        end

        def build_request_url(path, params)
          URI::HTTP.build :host => API_SERVER,
                          :path => "#{API_BASE}",
                          :query => params.map {|k,v| "#{k}=#{v}"}.join('&')
        end
      end
    end
  end
end