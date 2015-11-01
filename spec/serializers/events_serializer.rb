require 'rails_helper'

describe EventsSerializer do 
  let(:event_1) { double 'event_1', sport_id: 1, event_id: 2, title: "Barça v Madrid", is_virtual: false }
  let(:events)  { [event_1] }
  
  let :expected_json do
    [
      { sport_id: 1, event_id: 2, title: "Barça v Madrid", is_virtual: false }
    ]
  end

  subject { described_class.new events }

  describe 'call' do
    it 'builds json properly' do
      expect(subject.call).to eq expected_json
    end
  end
end