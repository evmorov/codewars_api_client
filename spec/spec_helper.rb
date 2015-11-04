require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
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
