module Sports
  class Get
    def initialize api_content
      @api_content = api_content
    end

    def call
      api_content["sports"].map do |sport|
        sport["title"]
      end
    end

    private

    attr_reader :api_content
  end
end