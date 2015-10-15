module Sports
  class Show
    def initialize params, content
      @params  = params
      @content = content
    end

    def call
      content.fetch("sports").find do |sport|
        sport["id"].to_i == id.to_i
      end
    end

    private

    attr_reader :params, :content

    delegate :id, to: :params
  end
end

#what else can content be? nil etc