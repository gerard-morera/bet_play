module Events
  class Get
    def initialize params
      @params = params
    end

    def call
      binding.pry
      sport["events"].map do |event|
        event["event_id"]
      end
    end

    private

    def sport
      selected_sport =  Sports::Show.new params
      selected_sport.call
    end

    attr_reader :params
  end
end

#mirar categorització desports,
# Sports::Get  => index (Torna titol)
# Sports::Show => Show  (torna objecte)
