module Sports
  class Get
    def initialize content
      @content = content
    end

    def call
      if content.has_key? "sports"
        build_sport
      else
        NullSport.new
      end
    end

    private

    def build_sport
      sports = content.fetch "sports"

      sports.each_with_object([]) do |sport, accum|
        accum << Sport.new(sport)
      end
    end

    attr_reader :content
  end
end