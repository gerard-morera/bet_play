require 'rails_helper'

feature 'events display' do

  before(:each) do
    Capybara.current_driver = :selenium

    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(response, {:status => [500, "Internal Server Error"]})
  end

  context "when external api works" do
    context "when there are live events" do
    end

    context "when there are not live events" do
    end
  end

  context "when external api does not work" do
     let (:response) {{status: 200, body: body, headers: {}}}

    scenario 'page response with error' do
      visit '/'
      click_link 'Football'

      expect(page).to have_text("We are having problems connecting to the server")
    end
  end

  def body
    "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\",\"events\":[{\"event_id\":292582210,\"title\":\"Barça-Madrid\",\"is_virtual\":\"false\"}]},{\"id\":100,\"title\":\"Tennis\"}]}"
  end
end