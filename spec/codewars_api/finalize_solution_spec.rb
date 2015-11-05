require 'spec_helper'

describe CodewarsApi::FinalizeSolution do
  before do
    stub_finalize_solution
  end

  let(:finalize_solution) do
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.finalize_solution(
      project_id: '562cbb369116fb896c00002a',
      solution_id: '562cbb379116fb896c00002c'
    )
  end

  describe '#success' do
    it 'returns success' do
      expect(finalize_solution.success).to be(true)
    end
  end

  describe '#to_h' do
    it 'returns hash data' do
      expect(finalize_solution.to_h).to be_a(Hash)
    end
  end
end
