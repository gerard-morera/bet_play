require 'rails_helper'

RSpec.describe "CanGetOutcomes", type: :request do
  describe "GET /can_get_outcomes" do

    let(:content) { double 'content' }
    let(:get_content) do 
      {"version"=>"9", "sports"=>[{"id"=>101, "title"=>"Football", "events"=>[{"event_id"=>1728292, "outcomes" => [{"outcome_id" => "111"}, {"outcome_id" => "222"}]}, {"event_id"=>23873287}]}, {"id"=>100, "title"=>"Tenis"}]}
    end

    before do 
      allow(BetVictor::Content).to receive(:new).
        and_return(content)
      allow(content).to receive(:get).
        and_return(get_content)
    end

    context "with an outcomes hash" do
      it "has a 200 response status" do
        get sport_event_outcomes_path(:event_id => "1728292", :sport_id => "101")
        expect(response).to have_http_status(200)
      end

      it "returns a list of outcomes" do
        get sport_event_outcomes_path(:event_id => "1728292", :sport_id => "101")
        expect(response.body).to eq("[{\"sport_id\":\"101\",\"event_id\":\"1728292\",\"description\":\"no information\",\"price\":\"no information\",\"price_decimal\":\"no information\"},{\"sport_id\":\"101\",\"event_id\":\"1728292\",\"description\":\"no information\",\"price\":\"no information\",\"price_decimal\":\"no information\"}]")
      end
    end

    context "without an outcomes hash" do
      let(:get_content) {{}}

      it "has 200 response status" do
        get sport_event_outcomes_path(:event_id => "1728292", :sport_id => "101")
        expect(response).to have_http_status(200)
      end

      it "" do
        get sport_event_outcomes_path(:event_id => "1728292", :sport_id => "101")
        expect(response.body).to eq("{}")
      end
    end
  end
end
