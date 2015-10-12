module Events
  class Get
    def initialize params
      @params = params
    end

    def call
    end

    private

    attr_reader :params

    delegate :id, :content, to: :params
  end
end