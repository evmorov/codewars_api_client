module CodewarsApi
  class ResponseChecker
    def self.check_errors(response)
      unless response.code.to_i == 200
        raise "Response code is '#{response.code}'\n#{response.message}"
      end
    end
  end
end
