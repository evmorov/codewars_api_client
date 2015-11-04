require 'spec_helper'

describe CodewarsApi::User do
  before do
    stub_get('/users/some_user').to_return(json_response 'user.json')
  end

  let(:user) do
    client = CodewarsApi::Client.new(api_key: 'iT2dAoTLsv8tQe7KVLxe')
    client.user 'some_user'
  end

  describe '#username' do
    it 'returns username' do
      expect(user.username).to eql('some_user')
    end
  end

  describe '#name' do
    it 'returns full name' do
      expect(user.name).to eql('Some Person')
    end
  end

  describe '#honor' do
    it 'returns honor' do
      expect(user.honor).to eql(544)
    end
  end

  describe '#clan' do
    it 'returns clan' do
      expect(user.clan).to eql('some clan')
    end
  end

  describe '#leaderboard_position' do
    it 'returns leaderboard position' do
      expect(user.leaderboard_position).to eql(134)
    end
  end

  describe '#skills' do
    it 'returns an Array' do
      expect(user.skills).to be_an(Array)
    end
  end

  describe '#rank_overall' do
    it 'returns a Hash' do
      expect(user.rank_overall).to be_a(Hash)
    end

    it 'returns a Hash with keys: rank, name, color, score' do
      rank = user.rank_overall
      expect(rank).to have_key('rank')
      expect(rank).to have_key('name')
      expect(rank).to have_key('color')
      expect(rank).to have_key('score')
    end
  end

  describe '#rank_languages' do
    it 'returns a Hash' do
      expect(user.rank_languages).to be_a(Hash)
    end

    it 'returns a Hash with languages' do
      expect(user.rank_languages['coffeescript']).to be_a(Hash)
    end

    it 'languages has keys: rank, name, color, score' do
      user.rank_languages.each_value do |rank|
        expect(rank).to have_key('rank')
        expect(rank).to have_key('name')
        expect(rank).to have_key('color')
        expect(rank).to have_key('score')
      end
    end
  end

  describe '#katas_authored' do
    it 'returns katas authored' do
      expect(user.katas_authored).to eq(3)
    end
  end

  describe '#katas_completed' do
    it 'returns katas completed' do
      expect(user.katas_completed).to eq(230)
    end
  end

  describe '#to_h' do
    it 'returns hash data' do
      expect(user.to_h).to be_a(Hash)
    end
  end
end
