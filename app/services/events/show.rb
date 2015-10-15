module Events
  class Show
    def initialize params, sport
      @params = params
      @sport  = sport
    end

    def call
      existent_sport["events"].find do |event|
        event["event_id"].to_i == event_id.to_i
      end
    end

    private

    def existent_sport
      sport || NullSport.new
    end

    attr_reader :params, :sport

    delegate :event_id, to: :params
  end
end