require 'rails_helper'

RSpec.describe "CanGetEvents", type: :request do
  describe "GET /can_get_events" do
    it "works! (now write some real specs)" do
      get can_get_events_index_path
      expect(response).to have_http_status(200)
    end
  end
end
