class NullEvent
  def each_with_object value
    self 
  end

  def id
    "no information"
  end

  def sport_id
    "no information"
  end

  def title
    "no information"
  end

  def is_virtual
    "no information"
  end

  def has_key? value
    false
  end
end