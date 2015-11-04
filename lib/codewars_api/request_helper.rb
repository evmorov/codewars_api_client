module CodewarsApi
  module RequestHelper
    def post_request(endpoint, post_options)
      self.class.post(endpoint, post_options)
    end

    def add_api_key(post_options, api_key)
      post_options[:headers] = { 'Authorization' => api_key }
    end

    def add_body_option(post_options, body_option)
      post_options[:body] = body_option
    end
  end
end
