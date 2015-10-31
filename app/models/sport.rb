class Sport
  def initialize data
    @data = data
  end

  def id
    data.fetch "id", "no information"
  end

  def title
    data.fetch "title", "no information"
  end

  attr_reader :data
end
