module CodewarsApi
  class DeferredResponse
    include Common

    def initialize(options)
      api_key = options.delete!(:api_key)
      dmid = options.delete!(:dmid)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, api_key)

      @response = RequestHelper.get("#{CodewarsApi::API_URL}/deferred/#{dmid}", request_options)
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

    def output
      @response.to_h['output']
    end

    def wall_time
      @response.to_h['wall_time']
    end

    def status_code
      @response.to_h['status_code']
    end
  end
end
