module Nytimes
  module Events
    class List < Base
      attr_reader :batch_size

      def initialize(api_key, batch_size = 20)
        super(api_key)
        @batch_size = batch_size
        @current_offset = 0
        @previous_params = Hash.new
      end

      def find(params = {})
        @previous_params = params
        params.merge({'limit' => @batch_size, 'offset' => @current_offset})
        response = RestClient.get(api_url(params))

        response_code = response.net_http_res.instance_of?(Fixnum) ? response.net_http_res : response.code

        case response_code
        when 403
          raise RestClient::Exception, "Access forbidden by NYTimes API. Perhaps the API key isn't working?"
        when 200
          JSON.parse(response)
        end
      end

      def batch_size=(amount)
        @batch_size = amount
      end

      def next_page
        @current_offset += @batch_size
        find(@previous_params)
      end
      alias :next :next_page

      def prev_page
        @current_offset -= @batch_size unless @batch_size > @current_offset
        find(@previous_params)
      end
      alias :previous :prev_page
    end
  end
end