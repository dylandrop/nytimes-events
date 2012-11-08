module Nytimes
  module Events
    class List < Base
      def find(params = {})
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