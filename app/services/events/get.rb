module Events
  class Get
    def initialize params, content, sport_class: Sports::Show
      @params      = params
      @content     = content
      @sport_class = sport_class
    end

    def call
      existing_sport["events"].map do |event|
        event.slice("event_id", "title", "is_virtual").merge sport_id
      end.compact
    end

    private

    def existing_sport
      sport || NullSport.new
    end

    def sport
      @sport ||=  sport_class.new(params, content).call
    end

    def sport_id
      { "sport_id" => params.sport_id }
    end

    attr_reader :params, :content, :sport_class
  end
end