module Parsers
  class JsonToRuby
    def initialize json 
      @json = json
    end

    def call
      JSON.parse(json)
    rescue
      { "error_message" => "We are having problems connecting to the server" }
    end

    private

    attr_reader :json
  end
end