module CodewarsApi
  class AttemptSolution
    def initialize(options)
      fail 'API key is not set' unless options[:api_key]
      project_id = options.fetch(:project_id)
      solution_id = options.fetch(:solution_id)
      code = options.fetch(:code)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, options[:api_key])
      request_options = RequestHelper.add_body_option(request_options, code: code)

      @response = RequestHelper.post(
        "#{CodewarsApi::API_URL}"\
        "/code-challenges/projects/#{project_id}/solutions/#{solution_id}/attempt",
        request_options
      )
    end

    def success
      @response.to_h['success']
    end

    def dmid
      @response.to_h['dmid']
    end

    def to_h
      @response.to_h
    end
  end
end
