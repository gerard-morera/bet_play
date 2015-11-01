class NullOutcome
  def each_with_object value
    self 
  end

  def outcome_id
    "no information"
  end

  def sport_id
    "no information"
  end

  def description
    "no information"
  end

  def price
    "no information"
  end

  def decimal_price
    "no information"
  end

  def has_key? value
    false
  end
end