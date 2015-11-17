module CodewarsApi
  class User
    include Common

    def initialize(id_or_username)
      fail 'Username or id is not set' unless id_or_username
      @response = RequestHelper.get("#{CodewarsApi::API_URL}/users/#{id_or_username}")
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
  end
end
