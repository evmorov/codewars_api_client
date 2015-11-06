require 'httparty'

module CodewarsApi
  module RequestHelper
    include HTTParty
    base_uri CodewarsApi::BASE_URL

    def self.add_api_key(request_options, api_key)
      request_options = request_options.dup
      request_options[:headers] = { 'Authorization' => api_key }
      request_options
    end

    def self.add_body_options(request_options, body_options)
      request_options = request_options.dup
      request_options[:body] = body_options
      request_options
    end
  end
end
