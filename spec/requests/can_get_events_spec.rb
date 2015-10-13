require 'rails_helper'

RSpec.describe "CanGetEvents", type: :request do
  describe "GET /sport_events" do
    it "works! (now write some real specs)" do
      get sport_events_path(:sport_id => 100)
      expect(response).to have_http_status(200)
    end
  end
end
