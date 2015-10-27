module Sports
  class Get
    def initialize content
      @content = content
    end

    def call
      content.fetch("sports").map do |sport|
        sport.slice("id", "title")
      end
    rescue
      
      content
    end

    private

    attr_reader :content
  end
end