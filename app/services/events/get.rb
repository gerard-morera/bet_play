module Events
  class Get
    def initialize params, content, sport_show_class: Sports::Show
      @params            = params
      @content           = content
      @sport_show_class  = sport_show_class
    end

    def call
      if sport.has_key? "events"
        build_events
      else
        NullEvent.new
      end
    end

    private

    def build_events
      sport.fetch("events").map do |event|
        Event.new event, params
      end
    end

    def sport
      @sport ||=  sport_show_class.new(params, content).call
    end

    attr_reader :params, :content, :sport_show_class
  end
end