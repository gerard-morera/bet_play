module Events
  class Get
    def initialize params
      @params = params
    end

    def call
      sport.first["events"].map do |event|
        event.event_id
    end

    private

    def sport
      @sport ||= Sports::Show.new params
      sport.call
    end

    attr_reader :params

    delegate :id, :content, to: :params
  end
end

#mirar categorització desports,
# Sports::Get  => index (Torna titol)
# Sports::Show => Show  (torna objecte)
