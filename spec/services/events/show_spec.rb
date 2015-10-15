describe Events::Show do
  let(:sport) do
    { "id"=>100, "events" => [{"event_id"=>292582210}, {"event_id" => 12345, "outcomes" => [{"id" => 12},{"id" => 13}]}] }
  end
  let(:params)   { double 'params'}
  let(:id) { 12345 }

  subject { described_class.new params, sport }

  before do
    allow(params).to receive(:event_id).
      and_return(id)
  end

  describe 'call' do
    it 'returns the events' do
      expect(subject.call).to eq({"event_id"=>12345, "outcomes"=>[{"id"=>12}, {"id"=>13}]})
    end
  end
end