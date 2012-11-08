module Nytimes
  module Events
    class Listing < Base
      def find(params = {})
        response = RestClient.get(api_url(params))
        JSON.parse(response)
      end
    end
  end
end