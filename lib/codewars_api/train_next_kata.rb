require 'httparty'

module CodewarsApi
  class TrainNextKata
    include HTTParty
    base_uri 'https://www.codewars.com'

    def initialize(options)
      fail 'API key is not set' unless options[:api_key]

      language = options.fetch(:language)

      post_options = {}
      post_options[:headers] = { 'Authorization' => options[:api_key] }
      post_options[:body] = { 'peek' => options[:peek] } if options[:peek] # TODO: Refactor

      @response = self.class.post(
        "/api/v1/code-challenges/#{language}/train",
        post_options
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
