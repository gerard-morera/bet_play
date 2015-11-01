class EventsSerializer
  def initialize events
    @events = events
  end

  def call
    events.each_with_object([]) do |event, accum|
      accum << as_json(event)
    end
  end

  private

  def as_json event
    {
      event_id:   event.event_id,
      sport_id:   event.sport_id,
      title:      event.title,
      is_virtual: event.is_virtual
    }
  end

  attr_reader :events
end