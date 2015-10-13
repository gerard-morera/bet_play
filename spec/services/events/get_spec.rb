describe Events::Get do 
  let(:params)  { double 'params' }
  
  subject { described_class.new params }

  let(:selected_sport) { double 'selected_sport', call: sport}
  let(:sport) do 
    { "id"=>100, "events" => [{"event_id"=>292582210},{}]}
  end

  before do
    allow(Sports::Show).to receive(:new).with(params).
      and_return(selected_sport)

    allow(selected_sport).to receive(:call).
      and_return(sport)
  end

  describe 'call' do
    context 'when sport has value' do
      it 'gets the events ids' do 
        expect(subject.call).to eq([292582210])
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