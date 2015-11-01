module Sports
  class Show
    def initialize params, content
      @params  = params
      @content = content
    end

    def call
      if content.has_key? "sports"
        get_sport
      else
        NullSport.new
      end
    end

    private

    def get_sport
      sport || NullSport.new
    end

    def sport
      content.fetch("sports").find do |sport|
        sport["id"].to_i == sport_id.to_i
      end
    end

    attr_reader :params, :content

    delegate :sport_id, to: :params
  end
end