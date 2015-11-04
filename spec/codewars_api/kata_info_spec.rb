require 'spec_helper'

describe CodewarsApi::KataInfo do
  before do
    stub_get('/code-challenges/5277c8a221e209d3f6000b56')
      .to_return(json_response 'kata_info.json')
  end

  let(:kata) do
    id = '5277c8a221e209d3f6000b56'
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.kata_info(id)
  end

  describe '#id' do
    it 'returns id' do
      expect(kata.id).to eql('5277c8a221e209d3f6000b56')
    end
  end

  describe '#name' do
    it 'returns name' do
      expect(kata.name).to eql('Valid Braces')
    end
  end

  describe '#slug' do
    it 'returns slug' do
      expect(kata.slug).to eql('valid-braces')
    end
  end

  describe '#category' do
    it 'returns category' do
      expect(kata.category).to eql('algorithms')
    end
  end

  describe '#published_at' do
    it 'returns published_at' do
      expect(kata.published_at).to eql('2013-11-05T00:07:31Z')
    end
  end

  describe '#approved_at' do
    it 'returns approved_at' do
      expect(kata.approved_at).to eql('2013-12-20T14:53:06Z')
    end
  end

  describe '#languages' do
    it 'returns an Array' do
      expect(kata.languages).to be_an(Array)
    end
  end

  describe '#url' do
    it 'returns url' do
      expect(kata.url).to eql('http://www.codewars.com/kata/valid-braces')
    end
  end

  describe '#rank' do
    it 'returns a Hash' do
      expect(kata.rank).to be_a(Hash)
    end

    it 'has keys: id, name, color' do
      rank = kata.rank
      expect(rank).to have_key('id')
      expect(rank).to have_key('name')
      expect(rank).to have_key('color')
    end
  end

  describe '#created_at' do
    it 'returns creater at' do
      expect(kata.created_at).to eql('2013-02-17T19:32:02Z')
    end
  end

  describe '#creater_username' do
    it 'returns creater username' do
      expect(kata.creater_username).to eql('xDranik')
    end
  end

  describe '#creater_url' do
    it 'returns creater url' do
      expect(kata.creater_url).to eql('http://www.codewars.com/users/xDranik')
    end
  end

  describe '#approver_username' do
    it 'return approved username' do
      expect(kata.approver_username).to eql('xDranik')
    end
  end

  describe '#approver_url' do
    it 'returns approver url' do
      expect(kata.approver_url).to eql('http://www.codewars.com/users/xDranik')
    end
  end

  describe '#description' do
    it 'returns description' do
      expect(kata.description)
        .to eql('Write a function called `validBraces` that takes a string of braces')
    end
  end

  describe '#total_attempts' do
    it 'returns total attempts' do
      expect(kata.total_attempts).to eq(4911)
    end
  end

  describe '#total_completed' do
    it 'returns total completed' do
      expect(kata.total_completed).to eq(919)
    end
  end

  describe '#total_stars' do
    it 'returns total stars' do
      expect(kata.total_stars).to eq(12)
    end
  end

  describe '#vote_score' do
    it 'returns vote score' do
      expect(kata.vote_score).to eq(21)
    end
  end

  describe '#tags' do
    it 'returns an Array' do
      expect(kata.tags).to be_an(Array)
    end
  end

  describe '#contributors_wanted' do
    it 'returns contributors wanted' do
      expect(kata.contributors_wanted).to be(true)
    end
  end

  describe '#unresolved_issues' do
    it 'returns unresolved issues' do
      expect(kata.unresolved_issues).to eq(1)
    end
  end

  describe '#unresolved_suggestions' do
    it 'returns unresolved suggestions' do
      expect(kata.unresolved_suggestions).to eq(0)
    end
  end
end
