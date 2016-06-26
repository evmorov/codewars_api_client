require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
)
SimpleCov.start do
  add_filter '/spec/'
end

require 'codewars_api'
require 'webmock/rspec'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.filter_run_excluding check_api: ENV['CHECK_API'] || false
end

RSpec::Matchers.define :have_the_same_keys_as do |hash_expected|
  match do |hash_actual|
    map_keys(hash_expected).eql? map_keys(hash_actual)
  end

  failure_message do |actual|
    %(expect keys
    #{map_keys(actual)}
to equal
    #{map_keys(expected)})
  end

  def map_keys(hash)
    hash.map { |k, v| (v.is_a? Hash) ? { k => map_keys(v) } : k }
  end
end

def stub_attempt_solution
  project_id = '562cbb369116fb896c00002a'
  solution_id = '562cbb379116fb896c00002c'
  api_key = 'iT2dAoTLsv8tQe7KVLxe'
  stub_post("/code-challenges/projects/#{project_id}/solutions/#{solution_id}/attempt")
    .with(
      body: { code: 'import org.junit.Test;' },
      headers: { Authorization: api_key }
    ).to_return(json_response('attempt_solution.json'))
end

def stub_kata_info
  stub_get('/code-challenges/5277c8a221e209d3f6000b56').to_return(json_response('kata_info.json'))
end

def stub_deferred_response
  dmid = '4rsdaDf8d'
  api_key = 'iT2dAoTLsv8tQe7KVLxe'
  stub_get("/deferred/#{dmid}")
    .with(headers: { Authorization: api_key })
    .to_return(json_response('deferred_response.json'))
end

def stub_finalize_solution
  project_id = '562cbb369116fb896c00002a'
  solution_id = '562cbb379116fb896c00002c'
  api_key = 'iT2dAoTLsv8tQe7KVLxe'
  stub_post("/code-challenges/projects/#{project_id}/solutions/#{solution_id}/finalize")
    .with(headers: { Authorization: api_key })
    .to_return(json_response('finalize_solution.json'))
end

def stub_train_next_kata
  language = 'java'
  api_key = 'iT2dAoTLsv8tQe7KVLxe'
  stub_post("/code-challenges/#{language}/train")
    .with(headers: { Authorization: api_key })
    .to_return(json_response('train_next_kata.json'))
end

def stub_train_next_kata_peek
  language = 'java'
  api_key = 'iT2dAoTLsv8tQe7KVLxe'
  stub_post("/code-challenges/#{language}/train")
    .with(
      body: { peek: 'true' },
      headers: { Authorization: api_key }
    ).to_return(json_response('train_next_kata.json'))
end

def stub_train_specific_kata
  language = 'java'
  id_or_slug = '554b4ac871d6813a03000035'
  api_key = 'iT2dAoTLsv8tQe7KVLxe'
  stub_post("/code-challenges/#{id_or_slug}/#{language}/train")
    .with(headers: { Authorization: api_key })
    .to_return(json_response('train_specific_kata.json'))
end

def stub_user
  stub_get('/users/some_user').to_return(json_response('user.json'))
end

def stub_get(url)
  stub_request(:get, "#{CodewarsApi::BASE_URL}#{CodewarsApi::API_URL}#{url}")
end

def stub_post(url)
  stub_request(:post, "#{CodewarsApi::BASE_URL}#{CodewarsApi::API_URL}#{url}")
end

def json_response(file)
  {
    body: fixture(file),
    headers: { content_type: 'application/json; charset=utf-8' }
  }
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end
