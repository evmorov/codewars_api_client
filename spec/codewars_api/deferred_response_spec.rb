require 'spec_helper'

describe CodewarsApi::DeferredResponse do
  before do
    dmid = '4rsdaDf8d'
    api_key = 'iT2dAoTLsv8tQe7KVLxe'
    stub_get("/deferred/#{dmid}")
      .with(headers: { Authorization: api_key })
      .to_return(json_response 'deferred_response.json')
  end

  let(:deferred_response) do
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.deferred_response(dmid: '4rsdaDf8d')
  end

  describe '#success' do
    it 'returns success' do
      expect(deferred_response.success).to be(true)
    end
  end

  describe '#dmid' do
    it 'returns dmid' do
      expect(deferred_response.dmid).to eql('U8s6z0aK')
    end
  end

  describe '#solution_id' do
    it 'returns solution id' do
      expect(deferred_response.solution_id).to eql('562cbb379116fb896c00002c')
    end
  end

  describe '#valid' do
    it 'returns valid' do
      expect(deferred_response.valid).to be(false)
    end
  end

  describe '#server_error' do
    it 'returns server error' do
      expect(deferred_response.server_error).to eq(301)
    end
  end

  describe '#passed' do
    it 'returns passed' do
      expect(deferred_response.passed).to be(false)
    end
  end

  describe '#errors' do
    it 'returns errors' do
      expect(deferred_response.errors).to be(true)
    end
  end

  describe '#failed' do
    it 'returns failed' do
      expect(deferred_response.failed).to be(false)
    end
  end

  describe '#timed_out' do
    it 'returns timed out' do
      expect(deferred_response.timed_out).to be(true)
    end
  end

  describe '#summary_passed' do
    it 'returns summary passed' do
      expect(deferred_response.summary_passed).to eq(0)
    end
  end

  describe '#summary_failed' do
    it 'returns summary failed' do
      expect(deferred_response.summary_failed).to eq(0)
    end
  end

  describe '#summary_errors' do
    it 'returns summary errors' do
      expect(deferred_response.summary_errors).to eq(1)
    end
  end

  describe '#reason' do
    it 'returns reason' do
      expect(deferred_response.reason).to eql('-e: Value is not what was expected (Test::Error)')
    end
  end

  describe '#output' do
    it 'returns output' do
      expect(deferred_response.output.first)
        .to eql("<div class='console-failed'>Value is not what was expected</div>")
    end
  end

  describe '#wall_time' do
    it 'returns wall time' do
      expect(deferred_response.wall_time).to eq(2273)
    end
  end

  describe '#status_code' do
    it 'returns status code' do
      expect(deferred_response.status_code).to eq(200)
    end
  end

  describe '#to_h' do
    it 'returns hash data' do
      expect(deferred_response.to_h).to be_a(Hash)
    end
  end
end
