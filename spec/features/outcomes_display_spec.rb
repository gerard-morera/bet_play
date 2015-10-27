require 'rails_helper'

feature 'outcomes display' do
  before(:each) do
    Capybara.current_driver = :selenium

    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(response)
  end
end