module Events
  class Get
    def initialize params
      @params = params
    end

    def call
      json_content.fetch("sports").select do |sport|
        sport["id"] == id
      end
    end

    private

    attr_reader :params

    delegate :id, :content, to: :params
  end
end