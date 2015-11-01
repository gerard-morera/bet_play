
class StatusError < StandardError; end

module BetVictor 
  class Content
    PATH = '/live/en/live/list.json'

    def initialize parser_class: Parsers::JsonToRuby
      @parser_class = parser_class
    end

    def get 
      if response.status == 200
        parser(response.body).call
      else
        raise StatusError
      end
    end

    private 
    
    def connection
      Faraday.new(:url => host) do |connection|
        connection.request  :url_encoded
        connection.adapter  :net_http   
        connection.headers[:content_type] = 'application/json'
      end
    end

    def response
      connection.get PATH
    end

    def host
      'http://www.betvictor.com'
    end

    def parser args
      parser_class.new args
    end

    attr_reader :parser_class
  end
end

