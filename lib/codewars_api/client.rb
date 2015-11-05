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
      add_api_key(options)
      TrainNextKata.new(options)
    end

    def train_specific_kata(options)
      add_api_key(options)
      TrainSpecificKata.new(options)
    end

    def attempt_solution(options)
      add_api_key(options)
      AttemptSolution.new(options)
    end

    def finalize_solution(options)
      add_api_key(options)
      FinalizeSolution.new(options)
    end

    def deferred_response(options)
      add_api_key(options)
      DeferredResponse.new(options)
    end

    private

    def add_api_key(options)
      options[:api_key] = @api_key
    end
  end
end
