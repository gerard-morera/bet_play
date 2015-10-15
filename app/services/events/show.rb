module Events
  class Show
    def initialize params, sport
      @params = params
      @sport  = sport
    end

    def call
      sport["events"].find do |event|
        event["event_id"]== event_id
      end
    end

    private

    attr_reader :params, :sport

    delegate :event_id, to: :params
  end
end