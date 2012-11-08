module Nytimes
  module Events
    class List < Base
      def initialize(api_key, batch_size = 20)
        super(api_key)
        @batch_size = batch_size
      end

      def find(params = {})
        params.merge({'limit' => @batch_size})
        response = RestClient.get(api_url(params))
        case response.net_http_res
        when 403
          raise RestClient::Exception, "Access forbidden by NYTimes API. Perhaps the API key isn't working?"
        when 200
          JSON.parse(response)
        end
      end
    end
  end
end