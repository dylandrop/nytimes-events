module Nytimes
  module Events
    class Listing < Base

      class << self
        def find(params = {})
          response = RestClient.get(API_URL, params)
          JSON.parse(response)
        end
      end
    end
  end
end