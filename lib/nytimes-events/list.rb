module Nytimes
  module Events
    class List < Base
      attr_reader :batch_size

      def initialize(api_key, batch_size = 20)
        super(api_key)
        @batch_size = batch_size
        @current_offset = nil
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

      def batch_size=(amount)
        @batch_size = amount
      end
    end
  end
end