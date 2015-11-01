require 'rails_helper'

RSpec.describe "CanGetEvents", type: :request do
  describe "GET /sport_events" do

    let(:content) { double 'content' }
    let(:get_content) do
      {"version"=>"9", "sports"=>[{"id"=>101, "title"=>"Football", "events"=>[{"event_id"=>1728292}, {"event_id"=>23873287}]}, {"id"=>100, "title"=>"Tenis"}]}
    end

    before do
      allow(BetVictor::Content).to receive(:new).
        and_return(content)
      allow(content).to receive(:get).
        and_return(get_content)
    end

    context "with an events hash" do
      it "has 200 response status" do
        get sport_events_path(:sport_id => "101")
        expect(response).to have_http_status(200)
      end

      it "returns a list of events" do
        get sport_events_path(:sport_id => "101")
        expect(response.body).to eq("[{\"event_id\":1728292,\"sport_id\":\"101\",\"title\":\"no information\",\"is_virtual\":\"no information\"},{\"event_id\":23873287,\"sport_id\":\"101\",\"title\":\"no information\",\"is_virtual\":\"no information\"}]")
      end
    end

    context "without an events hash" do
      let(:get_content) {{}}

      it "has 200 response status" do
        get sport_events_path(:sport_id => "101")
        expect(response).to have_http_status(200)
      end

      it "" do
        get sport_events_path(:sport_id => "101")
        expect(response.body).to eq("{}")
      end
    end
  end
end
