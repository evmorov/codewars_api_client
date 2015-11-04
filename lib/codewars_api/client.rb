require 'httparty'

module CodewarsApi
  class Client
    attr_reader :api_key

    def initialize(options)
      @api_key = options[:api_key] if options[:api_key]
    end

    def user(username)
      User.new(username)
    end

    def kata_info(id_or_slug)
      KataInfo.new(id_or_slug)
    end

    def train_next_kata(options)
      options[:api_key] = @api_key
      TrainNextKata.new(options)
    end

    def train_specific_kata(options)
      options[:api_key] = @api_key
      TrainSpecificKata.new(options)
    end

    def attempt_solution(options)
      options[:api_key] = @api_key
      AttemptSolution.new(options)
    end

    def finalize_solution(options)
      options[:api_key] = @api_key
      FinalizeSolution.new(options)
    end

    def deferred_response(options)
      options[:api_key] = @api_key
      DeferredResponse.new(options)
    end
  end
end
