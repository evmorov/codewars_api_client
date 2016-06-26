module CodewarsApi
  class ResponseChecker
    def self.check_errors(response)
      raise response.message if response.code == 500
    end
  end
end
