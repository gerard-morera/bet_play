require 'rails_helper'

feature 'outcomes display' do
  let (:first_request_response)  {{status: 200, body: body, headers: {}}}
  let (:second_request_response) {{status: 200, body: body, headers: {}}}
  
  before(:each) do
    Capybara.current_driver = :selenium

    stub_request(:get, "http://www.betvictor.com/live/en/live/list.json").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.9.1'}).
      to_return(first_request_response, second_request_response, third_request_response)
  end

  context "when external api works" do
    context "and there are live outcomes" do
      let (:third_request_response) {{status: 200, body: body, headers: {}}}
    
      scenario 'page show the right content' do
        visit '/'

        click_link 'Football'
        click_link 'Barça-Madrid'

        expect(page).to have_css(".description",  :text => "Barça")
        expect(page).to have_css(".pricedecimal", :text => "1.66666667")
        expect(page).to have_css(".price", :text => "4/6")
      end
    end
  end

  def body
    "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\",\"events\":[{\"event_id\":292582210,\"title\":\"Barça-Madrid\",\"is_virtual\":\"false\",\"outcomes\":[{\"description\":\"Barça\",\"price\":\"4/6\",\"price_decimal\":1.66666667},{\"description\":\"Madrid\"}]}]},{\"id\":100,\"title\":\"Tennis\"}]}"
  end
end