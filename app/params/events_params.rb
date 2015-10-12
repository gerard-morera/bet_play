class EventsParams
  def initialize raw_params
    @raw_params = raw_params
  end

  def id
    raw_params.fetch :id
  end

  private

  attr_reader :raw_params
end