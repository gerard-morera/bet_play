require 'rails_helper'

feature 'sports displayment' do

  before(:each) do
    Capybara.current_driver = :selenium

    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(status: 200, body: "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\",\"events\":[{\"event_id\":292582210,\"title\":\"Barça-Madrid\",\"is_virtual\":\"false\"}]},{\"id\":100,\"title\":\"Tenis\"}]}", 
        headers: {})
  end

  scenario 'user access to the site' do
    visit '/'

    expect(page).to have_text("Football")
    expect(page).to have_text("Tenis")
    expect(page).to have_selector(".events")
  end
end
