class Igdb::Requester
  class << self
    def request_headers
      Hash.new.tap do |headers|
        headers['Content-Type'] = 'text/json'
        headers['user-key'] = api.api_key
      end
    end

    def get(action, params={})
      url = api.url_for(action, params)
      p url
      p request_headers
      perform_request do
        parse_response(RestClient.get(url, request_headers))
      end
    end
  end
end
