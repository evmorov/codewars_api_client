module CodewarsApi
  class TrainSpecificKata
    def initialize(options)
      api_key = options.delete!(:api_key)
      language = options.delete!(:language)
      id_or_slug = options.delete!(:id_or_slug)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, api_key)

      @response = RequestHelper.post(
        "#{CodewarsApi::API_URL}/code-challenges/#{id_or_slug}/#{language}/train",
        request_options
      )
    end

    def success
      @response.to_h['success']
    end

    def name
      @response.to_h['name']
    end

    def slug
      @response.to_h['slug']
    end

    def description
      @response.to_h['description']
    end

    def author
      @response.to_h['author']
    end

    def rank
      @response.to_h['rank']
    end

    def average_completion
      @response.to_h['averageCompletion']
    end

    def tags
      @response.to_h['tags']
    end

    def project_id
      @response.to_h['session'].andand['projectId']
    end

    def solution_id
      @response.to_h['session'].andand['solutionId']
    end

    def code_setup
      @response.to_h['session'].andand['setup']
    end

    def tests_setup
      @response.to_h['session'].andand['exampleFixture']
    end

    def code
      @response.to_h['session'].andand['code']
    end

    def recently_attempted
      @response.to_h['session'].andand['recentlyAttempted']
    end

    def to_h
      @response.to_h
    end
  end
end
