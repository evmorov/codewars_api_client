require 'httparty'

module CodewarsApi
  class FinalizeSolution
    include HTTParty
    base_uri CodewarsApi::BASE_URL

    def initialize(options)
      fail 'API key is not set' unless options[:api_key]
      project_id = options.fetch(:project_id)
      solution_id = options.fetch(:solution_id)

      post_options = post_options(options[:api_key])
      @response = post_request(
        "/api/v1/code-challenges/projects/#{project_id}/solutions/#{solution_id}/finalize",
        post_options
      )
    end

    def success
      @response.to_h['success']
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

    def post_request(endpoint, post_options)
      self.class.post(endpoint, post_options)
    end
  end
end
