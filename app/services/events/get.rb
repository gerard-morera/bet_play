module Events
  class Get
    def initialize params
      @params = params
    end

    def call
      valid_sport["events"].map do |event|
        event["event_id"]
      end.compact
    end

    private

    def valid_sport
      sport || NullSport.new
    end

    def sport
      @selected_sport ||=  Sports::Show.new(params).call
    end

    attr_reader :params
  end
end

class NullSport
  def [] value
    []
  end
end

#mirar categorització desports,
# Sports::Get  => index (Torna titol)
# Sports::Show => Show  (torna objecte)
