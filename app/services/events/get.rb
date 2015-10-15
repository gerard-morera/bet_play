module Events
  class Get
    def initialize params, content, sport_class: Sports::Show
      @params      = params
      @content     = content
      @sport_class = sport_class
    end

    def call
      existing_sport["events"].map do |event|
        event["event_id"]
      end.compact
    end

    private

    def existing_sport
      sport || NullSport.new
    end

    def sport
      @sport ||=  sport_class.new(params, content).call
    end

    attr_reader :params, :content, :sport_class
  end
end