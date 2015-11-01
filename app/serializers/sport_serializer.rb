class SportSerializer
  def initialize data
    @data = data
  end

  def call
    binding.pry
    data.each_with_object([]) do |element, accum|
      accum << as_json(element)
    end
  end

  private

  def as_json element
    {
      id:    element.id,
      title: element.title
    }
  end

  attr_reader :data
end