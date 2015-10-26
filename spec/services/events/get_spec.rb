describe Events::Get do 
  let(:params)      { double 'params' }
  let(:content)     { double 'content' }
  let(:sport_class) { double 'sport_class'}
  let(:id)          { 5 }

  
  subject { described_class.new params, content, sport_class: sport_class }

  let(:selected_sport) { double 'selected_sport', call: sport}
  let(:sport) do 
    { "id"=>100, "events" => [{"event_id"=>292582210, "title" => "Barça-Madrid", "is_virtual" => "false"}]}
  end

  before do
    allow(sport_class).to receive(:new).with(params, content).
      and_return(selected_sport)

    allow(selected_sport).to receive(:call).
      and_return(sport)

    allow(params).to receive(:sport_id).
      and_return(id)
  end

  describe 'call' do
    context 'when sport has value' do
      it 'gets the events ids' do 
        expect(subject.call).to eq([{"event_id"=>292582210, "title" => "Barça-Madrid", "is_virtual"=>"false", "sport_id"=>5}])
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