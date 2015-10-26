require 'simplecov'
require 'webmock/rspec'

SimpleCov.start

WebMock.disable_net_connect!(allow_localhost: true, allow: /http:\/\/127.0.0.1:(\d+)/)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(status: 200, body: "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\",\"events\":[{\"event_id\":292582210,\"title\":\"Barça-Madrid\",\"is_virtual\":\"false\"}]},{\"id\":100,\"title\":\"Tenis\"}]}", 
        headers: {})
  end
  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

