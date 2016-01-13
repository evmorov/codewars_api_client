require 'uri'
require 'net/http'
require 'net/https'
require 'json'

module CodewarsApi
  module RequestHelper
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

    def self.post(url, options = {})
      uri = URI(CodewarsApi::BASE_URL + url)
      headers = { 'Content-Type' => 'application/json' }
      headers.merge! options[:headers] if options
      request = Net::HTTP::Post.new(uri.path, headers)
      request.body = options[:body].to_json if options
      https(uri).request(request)
    end

    def self.get(url, options = nil)
      uri = URI(CodewarsApi::BASE_URL + url)
      headers = options[:headers] if options
      https(uri).request_get uri, headers
    end

    private

    def self.https(uri)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      https
    end
  end
end

module Net
  class HTTPResponse
    def to_h
      JSON.parse(body).to_h
    end
  end
end
