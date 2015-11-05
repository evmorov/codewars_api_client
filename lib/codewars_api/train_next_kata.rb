module CodewarsApi
  class TrainNextKata
    def initialize(options)
      fail 'API key is not set' unless options[:api_key]
      language = options.fetch(:language)

      request_options = {}
      request_options = RequestHelper.add_api_key(request_options, options[:api_key])
      if options[:peek]
        request_options = RequestHelper.add_body_option(request_options, peek: options[:peek])
      end

      @response = RequestHelper.post(
        "#{CodewarsApi::API_URL}/code-challenges/#{language}/train",
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

    def to_h
      @response.to_h
    end
  end
end
