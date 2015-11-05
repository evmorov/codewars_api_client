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
      stub_user

      user = client.user('some_user')
      expect(user).to be_a(CodewarsApi::User)
    end
  end

  describe '#kata_info' do
    context 'using id' do
      it 'returns Codewars::KataInfo' do
        stub_kata_info

        kata = client.kata_info('5277c8a221e209d3f6000b56')
        expect(kata).to be_a(CodewarsApi::KataInfo)
      end
    end
  end

  describe '#train_next_kata' do
    it 'returns Codewars::TrainNextKata' do
      stub_train_next_kata

      train_next_kata = client.train_next_kata(language: 'java')
      expect(train_next_kata).to be_a(CodewarsApi::TrainNextKata)
    end
  end

  describe '#train_specific_kata' do
    it 'returns Codewars::TrainSpecificKata' do
      stub_train_specific_kata

      train_specific_kata = client.train_specific_kata(
        id_or_slug: '554b4ac871d6813a03000035',
        language: 'java'
      )
      expect(train_specific_kata).to be_a(CodewarsApi::TrainSpecificKata)
    end
  end

  describe '#attempt_solution' do
    it 'returns Codewars::AttemptSolution' do
      stub_attempt_solution

      attempt_solution = client.attempt_solution(
        project_id: '562cbb369116fb896c00002a',
        solution_id: '562cbb379116fb896c00002c',
        code: 'import org.junit.Test;'
      )
      expect(attempt_solution).to be_a(CodewarsApi::AttemptSolution)
    end
  end

  describe '#finalize_solution' do
    it 'returns Codewars::FinalizeSolution' do
      stub_finalize_solution

      finalize_solution = client.finalize_solution(
        project_id: '562cbb369116fb896c00002a',
        solution_id: '562cbb379116fb896c00002c'
      )
      expect(finalize_solution).to be_a(CodewarsApi::FinalizeSolution)
    end
  end

  describe '#deferred_response' do
    it 'returns Codewars::DeferredResponse' do
      stub_deferred_response

      deferred_response = client.deferred_response(dmid: '4rsdaDf8d')
      expect(deferred_response).to be_a(CodewarsApi::DeferredResponse)
    end
  end
end
