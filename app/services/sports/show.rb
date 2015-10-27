module Sports
  class Show
    def initialize params, content
      @params  = params
      @content = content
    end

    def call
      content.fetch("sports").find do |sport|
        sport["id"].to_i == sport_id.to_i
      end
    rescue
      
      content
    end

    private

    attr_reader :params, :content

    delegate :sport_id, to: :params
  end
end