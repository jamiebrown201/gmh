module Web::Controllers::Tfl
  class Index
    include Web::Action

    def call(params)
      @display = HTTParty.get("https://api.tfl.gov.uk/journey/journeyresults/TW92NQ/to/e20ap")
     end
      self.body = @display
    end

    private

    def journey
      raw_data = api_call["journeys"].first
      filtered_data = {}
      filtered_data["duration"] = raw_data["duration"]
      filtered_data["legs"] = legs(raw_data["legs"])
      filtered_data
    end

    def legs(raw_legs)
      raw_legs.map{ |leg| leg["instruction"]["summary"] }
    end

    def api_call
     HTTParty.get("https://api.tfl.gov.uk/journey/journeyresults/TW92NQ/to/e20ap")
    end
  end
end
