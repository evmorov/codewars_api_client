require 'httparty'

module CodewarsApi
  class User
    include HTTParty
    base_uri CodewarsApi::BASE_URL

    def initialize(username)
      fail 'Usernam is not set' unless username
      @response = self.class.get("#{CodewarsApi::API_URL}/users/#{username}")
    end

    def username
      @response.to_h['username']
    end

    def name
      @response.to_h['name']
    end

    def honor
      @response.to_h['honor']
    end

    def clan
      @response.to_h['clan']
    end

    def leaderboard_position
      @response.to_h['leaderboardPosition']
    end

    def skills
      @response.to_h['skills']
    end

    def rank_overall
      @response.to_h['ranks'].andand['overall']
    end

    def rank_languages
      @response.to_h['ranks'].andand['languages']
    end

    def katas_authored
      @response.to_h['codeChallenges'].andand['totalAuthored']
    end

    def katas_completed
      @response.to_h['codeChallenges'].andand['totalCompleted']
    end

    def to_h
      @response.to_h
    end
  end
end
