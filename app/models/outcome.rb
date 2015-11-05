class Outcome
  def initialize data, params
    @data   = data
    @params = params
  end

  def price_decimal
    data.fetch "price_decimal", "no information"
  end

  def description
    data.fetch "description", "no information"
  end

  def price
    data.fetch "price", "no information"
  end

  private

  attr_reader :data, :params

  delegate :sport_id, :event_id, to: :params
end
