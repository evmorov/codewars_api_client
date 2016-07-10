module CodewarsApi
  class ResponseChecker
    def self.check_errors(response)
      raise response.message unless response.code == 200
    end
  end
end
