module CodewarsApi
  module Common
    def success
      @response.to_h['success']
    end

    def reason
      @response.to_h['reason']
    end

    def to_h
      @response.to_h
    end
  end
end
