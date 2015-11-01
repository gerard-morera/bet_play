class Event
  def initialize data, params
    @data   = data
    @params = params
  end

  def event_id
    data.fetch "event_id", "no information"
  end

  def is_virtual
    data.fetch "is_virtual", "no information"
  end

  def title
    data.fetch "title", "no information"
  end

  private

  attr_reader :data, :params

  delegate :sport_id, to: :params
end