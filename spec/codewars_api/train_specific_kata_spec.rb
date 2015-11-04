require 'spec_helper'

describe CodewarsApi::TrainSpecificKata do
  before do
    language = 'java'
    id_or_slug = '554b4ac871d6813a03000035'
    api_key = 'iT2dAoTLsv8tQe7KVLxe'
    stub_post("/code-challenges/#{id_or_slug}/#{language}/train")
      .with(headers: { Authorization: api_key })
      .to_return(json_response 'train_specific_kata.json')
  end

  let(:train_specific_kata) do
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.train_specific_kata(
      language: 'java',
      id_or_slug: '554b4ac871d6813a03000035'
    )
  end

  describe '#success' do
    it 'returns success' do
      expect(train_specific_kata.success).to be(true)
    end
  end

  describe '#name' do
    it 'returns name' do
      expect(train_specific_kata.name).to eql('Anything to integer')
    end
  end

  describe '#slug' do
    it 'returns slug' do
      expect(train_specific_kata.slug).to eql('anything-to-integer')
    end
  end

  describe '#description' do
    it 'returns description' do
      expect(train_specific_kata.description)
        .to eql('Your task is to program a function which converts')
    end
  end

  describe '#author' do
    it 'returns author' do
      expect(train_specific_kata.author).to eql('Jake Hoffner')
    end
  end

  describe '#rank' do
    it 'returns rank' do
      expect(train_specific_kata.rank).to eq(-6)
    end
  end

  describe '#average_completion' do
    it 'returns average completion' do
      expect(train_specific_kata.average_completion).to eq(125.4)
    end
  end

  describe '#tags' do
    it 'returns an Array' do
      expect(train_specific_kata.tags).to be_an(Array)
    end
  end

  describe '#project_id' do
    it 'returns project id' do
      expect(train_specific_kata.project_id).to eql('523f66fba0de5d94410001cb')
    end
  end

  describe '#solution_id' do
    it 'returns solution id' do
      expect(train_specific_kata.solution_id).to eql('53bc968d35fd2feefd000013')
    end
  end

  describe '#code_setup' do
    it 'returns code setup' do
      expect(train_specific_kata.code_setup).to eql('function toInteger(n) {}')
    end
  end

  describe '#tests_setup' do
    it 'returns tests setup' do
      expect(train_specific_kata.tests_setup).to eql('Test.expect(toInteger("4.55") === 4)')
    end
  end

  describe '#code' do
    it 'returns code' do
      expect(train_specific_kata.code).to be_nil
    end
  end

  describe '#recently_attempted' do
    it 'returns recently attempted' do
      expect(train_specific_kata.recently_attempted).to be_nil
    end
  end
end
