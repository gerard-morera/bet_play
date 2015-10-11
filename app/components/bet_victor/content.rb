module BetVictor
  class Content
    def get 
      response = connection.get '/live/en/live/list.json'

      response.body
    end

    private 
    
    def connection
      Faraday.new(:url => 'http://www.betvictor.com') do |connection|
        connection.request  :url_encoded
        connection.adapter  :net_http   
        connection.headers[:content_type] = 'application/json'
      end
    end
  end
end