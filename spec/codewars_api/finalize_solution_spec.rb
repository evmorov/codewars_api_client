require 'spec_helper'

describe CodewarsApi::FinalizeSolution do
  before do
    project_id = '562cbb369116fb896c00002a'
    solution_id = '562cbb379116fb896c00002c'
    api_key = 'iT2dAoTLsv8tQe7KVLxe'
    stub_post("/code-challenges/projects/#{project_id}/solutions/#{solution_id}/finalize")
      .with(headers: { Authorization: api_key })
      .to_return(json_response 'finalize_solution.json')
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
end
