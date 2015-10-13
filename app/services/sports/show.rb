module Sports
  class Show
    def initialize params
      @params = params
    end

    def call
      content.fetch("sports").select do |sport|
        sport["id"] == id
      end
    end

    private

      attr_reader :params

      delegate :id, :content, to: :params
  end
end