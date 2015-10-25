describe Events::Get do 
  let(:params)      { double 'params' }
  let(:content)     { double 'content' }
  let(:sport_class) { double 'sport_class'}

  
  subject { described_class.new params, content, sport_class: sport_class }

  let(:selected_sport) { double 'selected_sport', call: sport}
  let(:sport) do 
    { "id"=>100, "events" => [{"event_id"=>292582210, "tile" => "Barça-Madrid", "is_virtual" => "false"},{}]}
  end

  before do
    allow(sport_class).to receive(:new).with(params, content).
      and_return(selected_sport)

    allow(selected_sport).to receive(:call).
      and_return(sport)
  end

  describe 'call' do
    context 'when sport has value' do
      it 'gets the events ids' do 
        expect(subject.call).to eq([{"event_id"=>292582210, "is_virtual"=>"false"}, {}])
      end
    end

    context 'when sport nil' do
      let(:sport) { nil }

      it 'shows that there are no events available' do
        expect(subject.call).to eq([])
      end
    end
  end
end