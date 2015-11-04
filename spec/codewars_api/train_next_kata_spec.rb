require 'spec_helper'

describe CodewarsApi::TrainNextKata do
  before do
    language = 'java'
    api_key = 'iT2dAoTLsv8tQe7KVLxe'
    stub_post("/code-challenges/#{language}/train")
      .with(headers: { Authorization: api_key })
      .to_return(json_response 'train_next_kata.json')
  end

  let(:train_next_kata) do
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.train_next_kata(
      language: 'java'
    )
  end

  describe '#success' do
    it 'returns success' do
      expect(train_next_kata.success).to be(true)
    end
  end

  describe '#name' do
    it 'returns name' do
      expect(train_next_kata.name).to eql('Anything to integer')
    end
  end

  describe '#slug' do
    it 'returns slug' do
      expect(train_next_kata.slug).to eql('anything-to-integer')
    end
  end

  describe '#href' do
    it 'returns href' do
      expect(train_next_kata.href).to eql('/kata/anything-to-integer')
    end
  end

  describe '#description' do
    it 'returns description' do
      expect(train_next_kata.description)
        .to eql('Your task is to program a function which converts')
    end
  end

  describe '#author' do
    it 'returns author' do
      expect(train_next_kata.author).to eql('Jake Hoffner')
    end
  end

  describe '#rank' do
    it 'returns rank' do
      expect(train_next_kata.rank).to eq(-6)
    end
  end

  describe '#average_completion' do
    it 'returns average completion' do
      expect(train_next_kata.average_completion).to eq(125.4)
    end
  end

  describe '#tags' do
    it 'returns an Array' do
      expect(train_next_kata.tags).to be_an(Array)
    end
  end

  describe '#project_id' do
    it 'returns project id' do
      expect(train_next_kata.project_id).to eql('523f66fba0de5d94410001cb')
    end
  end

  describe '#solution_id' do
    it 'returns solution id' do
      expect(train_next_kata.solution_id).to eql('53bc968d35fd2feefd000013')
    end
  end

  describe '#code_setup' do
    it 'returns code setup' do
      expect(train_next_kata.code_setup).to eql('function toInteger(n) {}')
    end
  end

  describe '#tests_setup' do
    it 'returns tests setup' do
      expect(train_next_kata.tests_setup).to eql('Test.expect(toInteger("4.55") === 4)')
    end
  end

  describe '#code' do
    it 'returns code' do
      expect(train_next_kata.code).to be_nil
    end
  end

  describe '#to_h' do
    it 'returns hash data' do
      expect(train_next_kata.to_h).to be_a(Hash)
    end
  end
end
