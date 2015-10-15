module Events
  class Show
    def initialize params, sport
      @params = params
      @sport  = sport
    end

    def call
      sport[:event_id]
    end

    private

    attr_reader :params, :sport

    delegate :event_id, to: :params
  end
end