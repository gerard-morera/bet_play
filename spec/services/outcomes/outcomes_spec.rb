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
    context 'with matchable events' do
      it 'returns the events' do
        expect(subject.call).to eq([{"id"=>12}, {"id"=>13}])
      end
    end

    context 'with events == nil' do
      let(:event) { nil }
      it 'returns an empty array' do
        expect(subject.call).to eq([])
      end
    end
  end
end