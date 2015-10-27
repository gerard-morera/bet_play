module Outcomes 
  class Get
    def initialize params, content, sport_show_class: Sports::Show, event_show_class: Events::Show
      @params  = params
      @content = content
      @sport_show_class = sport_show_class
      @event_show_class = event_show_class
    end

    def call
      existing_event.fetch("outcomes")
    rescue

      existing_event
    end

    private

    def sport
      sport = sport_show_class.new params, content
      sport.call
    end

    def event
      event = event_show_class.new params, sport
      event.call
    end

    def existing_event
      event || NullEvent.new
    end

    attr_reader :params, :content, :sport_show_class, :event_show_class
  end
end
