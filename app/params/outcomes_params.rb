class OutcomesParams
  def initialize raw_params
    @raw_params = raw_params
  end

  def sport_id
    raw_params.fetch "sport_id"
  end

  def event_id
    raw_params.fetch "event_id"
  end

  private

  attr_reader :raw_params
end