module CodewarsApi
  class AttemptSolution
    include Common

    def initialize(options)
      api_key = options.delete!(:api_key)
      project_id = options.delete!(:project_id)
      solution_id = options.delete!(:solution_id)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, api_key)
      request_options = RequestHelper.add_body_options(request_options, options)

      @response = RequestHelper.post(
        "#{CodewarsApi::API_URL}"\
        "/code-challenges/projects/#{project_id}/solutions/#{solution_id}/attempt",
        request_options
      )
      ResponseChecker.check_errors(@response)
    end

    def dmid
      @response.to_h['dmid']
    end
  end
end
