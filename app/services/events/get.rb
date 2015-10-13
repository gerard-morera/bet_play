module Events
  class Get
    def initialize params, content
      @params  = params
      @content = content
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
      @sport ||=  Sports::Show.new(params, content).call
    end

    attr_reader :params, :content
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
