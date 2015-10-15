module Outcomes 
  class Get
    def initialize params, content, sport_class: Sport::Show, event_class: Event::Show
      @params  = params
      @content = content
    end

    def call
      event["outcomes"]
    end

    private

    def sport
      sport = show_sport_class.new params, content
      sport.call
    end

    def event
      event = show_event_class.new params, sport
      event.call
    end

    attr_reader :params, :content
  end
end