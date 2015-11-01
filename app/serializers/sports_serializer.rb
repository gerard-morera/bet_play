class SportsSerializer
  def initialize sports
    @sports = sports
  end

  def call
    sports.each_with_object([]) do |sport, accum|
      accum << as_json(sport)
    end
  end

  private

  def as_json sport
    {
      id:    sport.id,
      title: sport.title
    }
  end

  attr_reader :sports
end