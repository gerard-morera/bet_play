class OutcomesSerializer
  def initialize outcomes
    @outcomes = outcomes
  end

  def call
    outcomes.each_with_object([]) do |outcome, accum|
      accum << as_json(outcome)
    end
  end

  private

  def as_json outcome
    {
      sport_id:      outcome.sport_id,
      event_id:      outcome.event_id,
      description:   outcome.description,
      price:         outcome.price,
      price_decimal: outcome.price_decimal
    }
  end

  attr_reader :outcomes
end