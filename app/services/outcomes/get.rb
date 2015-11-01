module Outcomes 
  class Get
    def initialize params, content, sport_show_class: Sports::Show, event_show_class: Events::Show
      @params  = params
      @content = content
      @sport_show_class = sport_show_class
      @event_show_class = event_show_class
    end

    def call
      if event.has_key? 'outcomes'
        build_outcomes
      else
        NullOutcome.new
      end
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

    attr_reader :params, :content, :sport_show_class, :event_show_class
  end
end
