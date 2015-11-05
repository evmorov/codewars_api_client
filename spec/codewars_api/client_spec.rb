require 'spec_helper'

describe CodewarsApi::Client do
  let(:client) { CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe') }

  describe '#new' do
    it 'returns Codewars::Client' do
      expect(client).to be_a(CodewarsApi::Client)
    end
  end

  describe '#api_key' do
    it 'returns the api key' do
      expect(client.api_key).to eql('iT2dAoTLsv8tQe7KVLxe')
    end
  end

  describe '#user' do
    it 'returns Codewars::User using username' do
      stub_get('/users/some_user')
      user = client.user('some_user')
      expect(user).to be_a(CodewarsApi::User)
    end
  end

  describe '#kata_info' do
    context 'using id' do
      it 'returns Codewars::KataInfo' do
        kata_id = '5277c8a221e209d3f6000b56'
        stub_get("/code-challenges/#{kata_id}")
        kata = client.kata_info("#{kata_id}")
        expect(kata).to be_a(CodewarsApi::KataInfo)
      end
    end
  end

  describe '#train_next_kata' do
    it 'returns Codewars::TrainNextKata' do
      language = 'java'
      api_key = 'iT2dAoTLsv8tQe7KVLxe'
      stub_post("/code-challenges/#{language}/train")
        .with(headers: { Authorization: api_key })

      train_next_kata = client.train_next_kata(language: language)
      expect(train_next_kata).to be_a(CodewarsApi::TrainNextKata)
    end
  end

  describe '#train_specifc_kata' do
    it 'returns Codewars::TrainSpecificKata' do
      id_or_slug = '554b4ac871d6813a03000035'
      language = 'java'
      api_key = 'iT2dAoTLsv8tQe7KVLxe'
      stub_post("/code-challenges/#{id_or_slug}/#{language}/train")
        .with(headers: { Authorization: api_key })

      train_specific_kata = client.train_specific_kata(
        id_or_slug: id_or_slug,
        language: language
      )
      expect(train_specific_kata).to be_a(CodewarsApi::TrainSpecificKata)
    end
  end

  describe '#attempt_solution' do
    it 'returns Codewars::AttemptSolution' do
      project_id = '562cbb369116fb896c00002a'
      solution_id = '562cbb379116fb896c00002c'
      code = 'import org.junit.Test;'
      api_key = 'iT2dAoTLsv8tQe7KVLxe'
      stub_post("/code-challenges/projects/#{project_id}/solutions/#{solution_id}/attempt").with(
        body: { code: 'import org.junit.Test;' },
        headers: { Authorization: api_key }
      )

      attempt_solution = client.attempt_solution(
        project_id: project_id,
        solution_id: solution_id,
        code: code
      )
      expect(attempt_solution).to be_a(CodewarsApi::AttemptSolution)
    end
  end

  describe '#finalize_solution' do
    it 'returns Codewars::FinalizeSolution' do
      project_id = '562cbb369116fb896c00002a'
      solution_id = '562cbb379116fb896c00002c'
      api_key = 'iT2dAoTLsv8tQe7KVLxe'
      stub_post("/code-challenges/projects/#{project_id}/solutions/#{solution_id}/finalize")
        .with(headers: { Authorization: api_key })

      finalize_solution = client.finalize_solution(
        project_id: project_id,
        solution_id: solution_id
      )
      expect(finalize_solution).to be_a(CodewarsApi::FinalizeSolution)
    end
  end

  describe '#deferred_response' do
    it 'returns Codewars::DeferredResponse' do
      dmid = '4rsdaDf8d'
      api_key = 'iT2dAoTLsv8tQe7KVLxe'
      stub_get("/deferred/#{dmid}").with(headers: { Authorization: api_key })

      deferred_response = client.deferred_response(dmid: dmid)
      expect(deferred_response).to be_a(CodewarsApi::DeferredResponse)
    end
  end
end
