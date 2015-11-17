module CodewarsApi
  class TrainNextKata
    include Common

    def initialize(options)
      api_key = options.delete!(:api_key)
      language = options.delete!(:language)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, api_key)
      request_options = RequestHelper.add_body_options(request_options, options)

      @response = RequestHelper.post(
        "#{CodewarsApi::API_URL}/code-challenges/#{language}/train",
        request_options
      )
    end

    def name
      @response.to_h['name']
    end

    def slug
      @response.to_h['slug']
    end

    def href
      @response.to_h['href']
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
  end
end
