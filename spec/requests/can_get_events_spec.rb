require 'rails_helper'

RSpec.describe "CanGetEvents", type: :request do
  describe "GET /sport_events" do

    let(:content_instance) { double 'content_instance' }
    let(:content) do
      {"version"=>"9", "sports"=>[{"id"=>101, "title"=>"Football", "events"=>[{"event_id"=>1728292}, {"event_id"=>23873287}]}, {"id"=>100, "title"=>"Tenis"}]}
    end

    before do
      allow(BetVictor::Content).to receive(:new).
        and_return(content_instance)
      allow(content_instance).to receive(:get).
        and_return(content)
    end

    context "with events on the external API" do
      it "has 200 response status" do
        get sport_events_path(:sport_id => "101")
        expect(response).to have_http_status(200)
      end

      it "returns a list of events" do
        get sport_events_path(:sport_id => "101")
        expect(response.body).to eq("[1728292,23873287]")
      end
    end

    context "without events on the external API" do
      it "returns an empty array" do
        get sport_events_path(:sport_id => "000")
        expect(response.body).to eq("[]")
      end
    end
  end
end
