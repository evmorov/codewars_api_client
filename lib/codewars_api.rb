begin
  require 'pry'
rescue LoadError
  nil
end

module CodewarsApi
  BASE_URL = 'https://www.codewars.com'
  API_URL = '/api/v1'
end

class Hash
  def delete!(key)
    fetch(key)
    delete(key)
  end
end

require 'andand'
require 'codewars_api/common'
require 'codewars_api/request_helper'
require 'codewars_api/version'
require 'codewars_api/client'
require 'codewars_api/user'
require 'codewars_api/kata_info'
require 'codewars_api/train_next_kata'
require 'codewars_api/train_specific_kata'
require 'codewars_api/attempt_solution'
require 'codewars_api/finalize_solution'
require 'codewars_api/deferred_response'
