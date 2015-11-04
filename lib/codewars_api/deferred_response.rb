require 'httparty'

module CodewarsApi
  class DeferredResponse
    include HTTParty
    base_uri CodewarsApi::BASE_URL

    def initialize(options)
      fail 'API key is not set' unless options[:api_key]
      dmid = options.fetch(:dmid)

      post_options = post_options(options[:api_key])
      @response = get_request(
        "/api/v1/deferred/#{dmid}",
        post_options
      )
    end

    def success
      @response.to_h['success']
    end

    def dmid
      @response.to_h['dmid']
    end

    def solution_id
      @response.to_h['solution_id']
    end

    def valid
      @response.to_h['valid']
    end

    def server_error
      @response.to_h['server_error']
    end

    def passed
      @response.to_h['passed']
    end

    def errors
      @response.to_h['errors']
    end

    def failed
      @response.to_h['failed']
    end

    def timed_out
      @response.to_h['timed_out']
    end

    def summary_passed
      @response.to_h['summary'].andand['passed']
    end

    def summary_failed
      @response.to_h['summary'].andand['failed']
    end

    def summary_errors
      @response.to_h['summary'].andand['errors']
    end

    def reason
      @response.to_h['reason']
    end

    def output
      @response.to_h['output']
    end

    def wall_time
      @response.to_h['wall_time']
    end

    def status_code
      @response.to_h['status_code']
    end

    def to_h
      @response.to_h
    end

    private

    def post_options(api_key)
      post_options = {}
      post_options[:headers] = { 'Authorization' => api_key }
      post_options
    end

    def get_request(endpoint, post_options)
      self.class.get(endpoint, post_options)
    end
  end
end
