require 'rails_helper'

describe Outcomes::Get do 
  let(:params)           { double 'params' }
  let(:content)          { double 'content' }
  let(:sport_show_class) { double 'sport_show_class' }
  let(:event_show_class) { double 'event_show_class' }
  
  let(:selected_sport)   { double 'selected_sport' }
  let(:sport)            { double 'sport' }
  let(:event)            { double 'event' }
  let(:selected_event)   { double 'selected_event' }
  let(:outcomes)         { [{}] }

  subject { described_class.new params, content, sport_show_class: sport_show_class, event_show_class: event_show_class }

  before do
    allow(sport_show_class).to receive(:new).
      with(params, content).and_return(selected_sport)
    allow(selected_sport).to receive(:call).
      and_return(sport)
    allow(event_show_class).to receive(:new).
      with(params, sport).and_return(selected_event)
    allow(selected_event).to receive(:call).
      and_return(event)
    allow(event).to receive(:fetch).
      with("outcomes").and_return(outcomes)
  end

  describe 'call' do
    context "when there are outcomes" do
      before do
        allow(event).to receive(:has_key?).
          with("outcomes").and_return(true)
      end
      
      it 'it modelize every outcome' do   
        expect(Outcome).to receive(:new)

        subject.call
      end
    end

    context "when there are not events" do
      before do
        allow(event).to receive(:has_key?).
          with("outcomes").and_return(false)
      end

      it 'returns null event' do 
        expect(subject.call).to be_instance_of(NullOutcome)
      end
    end
  end
end