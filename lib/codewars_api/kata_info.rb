require 'httparty'

module CodewarsApi
  class KataInfo
    include HTTParty
    base_uri 'https://www.codewars.com'

    def initialize(id)
      @response = self.class.get("/api/v1/code-challenges/#{id}")
    end

    def id
      @response.to_h['id']
    end

    def name
      @response.to_h['name']
    end

    def slug
      @response.to_h['slug']
    end

    def category
      @response.to_h['category']
    end

    def published_at
      @response.to_h['publishedAt']
    end

    def approved_at
      @response.to_h['approvedAt']
    end

    def languages
      @response.to_h['languages']
    end

    def url
      @response.to_h['url']
    end

    def rank
      @response.to_h['rank']
    end

    def created_at
      @response.to_h['createdAt']
    end

    def creater_username
      @response.to_h['createdBy'].andand['username']
    end

    def creater_url
      @response.to_h['createdBy'].andand['url']
    end

    def approver_username
      @response.to_h['approvedBy'].andand['username']
    end

    def approver_url
      @response.to_h['approvedBy'].andand['url']
    end

    def description
      @response.to_h['description']
    end

    def total_attempts
      @response.to_h['totalAttempts']
    end

    def total_completed
      @response.to_h['totalCompleted']
    end

    def total_stars
      @response.to_h['totalStars']
    end

    def vote_score
      @response.to_h['voteScore']
    end

    def tags
      @response.to_h['tags']
    end

    def contributors_wanted
      @response.to_h['contributorsWanted']
    end

    def unresolved_issues
      @response.to_h['unresolved'].andand['issues']
    end

    def unresolved_suggestions
      @response.to_h['unresolved'].andand['suggestions']
    end

    def to_h
      @response.to_h
    end
  end
end
