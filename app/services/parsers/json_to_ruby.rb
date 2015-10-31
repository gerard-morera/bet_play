module Parsers
  class JsonToRuby
    def initialize json 
      @json = json
    end

    def call
      JSON.parse(json)
    end

    private

    attr_reader :json
  end
end