require 'rails_helper'

describe Outcomes::Get do
  let(:params)  { double 'params' }
  let(:content) { double 'content' }
  let(:sport_instance) { double 'sport_instance' }
  let(:event_instance) { double 'event_instance' }
  let(:sport) {double 'sport'}
  let(:event) do
    {"event_id"=>12345, "outcomes"=>[{"id"=>12}, {"id"=>13}]}
  end

  subject { described_class.new params, content, sport_show_class: Sports::Show, event_show_class: Events::Show }

  before do
    allow(Sports::Show).to receive(:new).with(params, content).
      and_return(sport_instance)
    allow(sport_instance).to receive(:call).
      and_return(sport)
    allow(Events::Show).to receive(:new).with(params, sport).
      and_return(event_instance)
    allow(event_instance).to receive(:call).
      and_return(event)
  end

  describe 'call' do
    context 'with an external API working' do
      context 'and matchable events' do
        it 'returns the events' do
          expect(subject.call).to eq([{"id"=>12}, {"id"=>13}])
        end
      end

      context 'and no events' do
        let(:event) { nil }

        it 'returns an empty array' do
          expect(subject.call).to eq([])
        end
      end
    end

    context 'with external API not working' do
      let(:event)          { double 'message' }
      let(:existing_event) { event }

      before do
        allow(existing_event).to receive(:fetch).
          with("outcomes").and_return(event)
      end

      it 'returns the event hash' do
        expect(subject.call).to eq(existing_event)
      end
    end
  end
end