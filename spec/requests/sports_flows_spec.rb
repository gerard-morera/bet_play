require 'rails_helper'

RSpec.describe "SportsFlows", type: :request do
  describe "GET /sports_flows" do
    
    let(:content)     { double 'content' }
    let(:get_content) do 
      "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\"},{\"id\":100,\"title\":\"Tenis\"}]}"
    end

    before do
      allow(BetVictor::Content).to receive(:new).
        and_return(content)
      allow(content).to receive(:get).
        and_return(get_content)
    end

    it "has a 200 response status" do
      get api_v1_sports_path
      expect(response).to have_http_status(200)
    end

    it "returns the sports available in the external service" do
      get api_v1_sports_path
      expect(response.body).to eq("[\"Football\",\"Tenis\"]")
    end
  end
end
