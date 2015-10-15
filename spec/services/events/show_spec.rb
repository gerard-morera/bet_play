describe Events::Show do
  let(:sport)  {sport_content}
  let(:params) { double 'params'}
  let(:id)     { 12345 }

  let(:sport_content) do
    { "id"=>100, "events" => [{"event_id"=>292582210}, {"event_id" => 12345, "outcomes" => [{"id" => 12},{"id" => 13}]}] }
  end

  subject { described_class.new params, sport }

  before do
    allow(params).to receive(:event_id).
      and_return(id)
  end

  describe 'call' do
    context 'with available events' do
      it 'returns the events' do
        expect(subject.call).to eq({"event_id"=>12345, "outcomes"=>[{"id"=>12}, {"id"=>13}]})
      end
    end
    context 'without available events' do
      let(:sport_content) {{ "id"=>100, "events" => []}}
      it 'returns nil' do
        expect(subject.call).to eq(nil)
      end
    end

    context 'when sport is nil' do
      let(:sport_content) { nil }
      it 'returns nil' do
        expect(subject.call).to eq(nil)
      end
    end
  end
end