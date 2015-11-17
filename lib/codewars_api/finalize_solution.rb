module CodewarsApi
  class FinalizeSolution
    include Common

    def initialize(options)
      api_key = options.delete!(:api_key)
      project_id = options.delete!(:project_id)
      solution_id = options.delete!(:solution_id)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, api_key)

      @response = RequestHelper.post(
        "#{CodewarsApi::API_URL}"\
        "/code-challenges/projects/#{project_id}/solutions/#{solution_id}/finalize",
        request_options
      )
    end
  end
end
