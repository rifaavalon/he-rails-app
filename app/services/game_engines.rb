
module Igdb
  class Game_engines < Base
    attr_accessor :companies
                  :created_at
                  :description
                  :logo
                  :name
                  :platforms
                  :slug
                  :updated_at
                  :url

    MAX_LIMIT = 100
    CACHE_DEFAULTS = { expires_in: 7.days, force: false }

    def self.random(query = {})
      cache = CACHE_DEFAULTS.merge({ force: clear_cache })
      response = Request.where('game_engines', query.merge({ number: MAX_LIMIT }))
      companies = response.fetch('companies', []).map { |companies| Companies.new(companies) }
      [ companies, response[:errors] ]
    end

    def self.find(id)
      response = Request.get("game_engines")
      Companies.new(response)
    end

    def initialize(args = {})
      super(args)
      self.name = parse_name(args)
      self.description = parse_description(args)
    end

    def parse_name(args = {})
      args.fetch("extendedName", []).map { |name| Name.new(description) }
    end

    def parse_description(args = {})
      description = args["analyzedDescription"]
      if description
        steps = description.first.fetch("steps", [])
        steps.map { |description| Description.new(description) }
      end
    end
  end
end
