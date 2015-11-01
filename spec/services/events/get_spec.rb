require 'rails_helper'

describe Events::Get do 
  let(:params)           { double 'params' }
  let(:content)          { double 'content' }
  let(:sport_show_class) { double 'sport_show_class'}
  let(:selected_sport)   { double 'selected_sport' }
  let(:sport)            { double 'sport' }
  let(:events)           { [{}] }

  subject { described_class.new params, content, sport_show_class: sport_show_class }

  before do
    allow(sport_show_class).to receive(:new).with(params, content).
      and_return(selected_sport)
    allow(selected_sport).to receive(:call).
      and_return(sport)
    allow(sport).to receive(:fetch).
      with("events").and_return(events)
  end

  describe 'call' do
    context "when there are events" do
      before do
        allow(sport).to receive(:has_key?).
          with("events").and_return(true)
      end
      
      it 'it modelize every event' do   
        expect(Event).to receive(:new)

        subject.call
      end
    end

    context "when there are not events" do
      before do
        allow(sport).to receive(:has_key?).
          with("events").and_return(false)
      end

      it 'returns null event' do 
        expect(subject.call).to be_instance_of(NullEvent)
      end
    end
  end
end