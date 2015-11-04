require 'spec_helper'

describe 'API responses have expected keys', check_api: false do
  include HTTParty
  base_uri CodewarsApi::BASE_URL

  before(:all) do
    WebMock.allow_net_connect!
  end

  after(:all) do
    WebMock.disable_net_connect!
  end

  let(:client) do
    CodewarsApi::Client.new(api_key: ENV['API_KEY'])
  end

  describe 'GET User' do
    it 'returns keys equal to user.json'do
      hash_actual = client.user(ENV['USERNAME']).to_h
      hash_expected = JSON.parse(File.read fixture('user.json'))
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end

  describe 'GET Code Challenge' do
    it 'returns keys equal to kata_info.json'do
      hash_actual = client.kata_info('554b4ac871d6813a03000035').to_h
      hash_expected = JSON.parse(File.read fixture('kata_info.json'))
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end

  describe 'POST Train Next Code Challenge' do
    it 'returns keys equal to train_next_kata.json'do
      hash_actual = client.train_next_kata(
        peek: 'true',
        language: 'java'
      ).to_h
      hash_expected = JSON.parse(File.read fixture('train_next_kata.json'))
      hash_expected.delete('session') # no session in the response because of peek: true
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end

  describe 'POST Train Code Challenge' do
    it 'returns keys equal to train_specific_kata.json' do
      hash_actual = client.train_specific_kata(
        id_or_slug: '554b4ac871d6813a03000035',
        language: 'java'
      ).to_h
      hash_expected = JSON.parse(File.read fixture('train_specific_kata.json'))
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end

  describe 'POST Attempt Solution' do
    it 'returns keys equal to attempt_solution.json' do
      hash_actual = client.attempt_solution(
        project_id: '562cbb369116fb896c00002a',
        solution_id: '562cbb379116fb896c00002c',
        code: 'import org.junit.Test;\n\nimport static junit.framework.TestCase.fail;\nimport\
         static org.junit.Assert.*;\n\npublic class Tests {\n  @Test\n  public void Test1() {\n\
         assertEquals(\"42 -9\", Kata.HighAndLow(\"8 3 -5 42 -1 0 0 -9 4 7 4 -4\"));\n  }\n}'
      ).to_h
      hash_expected = JSON.parse(File.read fixture('attempt_solution.json'))
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end

  describe 'POST Finalize Solution' do
    it 'returns keys equal to finalize_solution_fail.json' do
      hash_actual = client.finalize_solution(
        project_id: '562cbb369116fb896c00002a',
        solution_id: '562cbb379116fb896c00002c'
      ).to_h
      hash_expected = JSON.parse(File.read fixture('finalize_solution_fail.json'))
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end

  describe 'GET Deferred Response' do
    let(:dmid) do
      client.attempt_solution(
        project_id: '562cbb369116fb896c00002a',
        solution_id: '562cbb379116fb896c00002c',
        code: 'import org.junit.Test;\n\nimport static junit.framework.TestCase.fail;\nimport\
         static org.junit.Assert.*;\n\npublic class Tests {\n  @Test\n  public void Test1() {\n\
         assertEquals(\"42 -9\", Kata.HighAndLow(\"8 3 -5 42 -1 0 0 -9 4 7 4 -4\"));\n  }\n}'
      ).dmid
    end

    it 'returns keys equal to deferred_response.json' do
      hash_actual = {}
      10.times do
        hash_actual = client.deferred_response(dmid: dmid).to_h
        break if hash_actual['success']
        sleep 1
      end
      hash_expected = JSON.parse(File.read fixture('deferred_response.json'))
      expect(hash_actual).to have_the_same_keys_as(hash_expected)
    end
  end
end
