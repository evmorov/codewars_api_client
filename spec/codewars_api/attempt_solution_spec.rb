require 'spec_helper'

describe CodewarsApi::AttemptSolution do
  before do
    stub_attempt_solution
  end

  let(:attempt_solution) do
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.attempt_solution(
      project_id: '562cbb369116fb896c00002a',
      solution_id: '562cbb379116fb896c00002c',
      code: 'import org.junit.Test;'
    )
  end

  describe '#success' do
    it 'returns success' do
      expect(attempt_solution.success).to be(true)
    end
  end

  describe '#dmid' do
    it 'returns dmid' do
      expect(attempt_solution.dmid).to eql('4rsdaDf8d')
    end
  end

  describe '#to_h' do
    it 'returns hash data' do
      expect(attempt_solution.to_h).to be_a(Hash)
    end
  end
end
