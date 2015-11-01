module Events
  class Show
    def initialize params, sport
      @params = params
      @sport  = sport
    end

    def call
      if sport.has_key? "events"
        get_event
      else
        NullEvent.new
      end
    end

    private

    def get_event
      event || NullEvent.new
    end

    def event
      sport.fetch("events").find do |event|
        event["event_id"].to_i == event_id.to_i
      end
    end

    attr_reader :params, :sport

    delegate :event_id, to: :params
  end
end