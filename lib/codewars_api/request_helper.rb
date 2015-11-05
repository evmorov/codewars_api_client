require 'httparty'

module CodewarsApi
  module RequestHelper
    include HTTParty
    base_uri CodewarsApi::BASE_URL

    def self.post_request(endpoint, request_options)
      post(endpoint, request_options)
    end

    def self.get_request(endpoint, request_options = {})
      get(endpoint, request_options)
    end

    def self.add_api_key(request_options, api_key)
      request_options = request_options.dup
      request_options[:headers] = { 'Authorization' => api_key }
      request_options
    end

    def self.add_body_option(request_options, body_option)
      request_options = request_options.dup
      request_options[:body] = body_option
      request_options
    end
  end
end
