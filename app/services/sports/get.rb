module Sports
  class Get
    def initialize content
      @content = content
    end

    def call
      content["sports"].map do |sport|
        sport.slice("id", "title")
      end
    end

    private

    attr_reader :content
  end
end