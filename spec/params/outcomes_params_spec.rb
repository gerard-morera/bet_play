describe OutcomesParams do
  let(:raw_params) do
    { "sport_id" => '100', "event_id" => '200' }
  end

  subject { described_class.new raw_params }

  describe 'sport_id' do
    it 'returns the value' do
      expect(subject.sport_id).to eq('100')
    end
  end

  describe 'event_id' do
    it 'returns the value' do
      expect(subject.event_id).to eq('200')
    end
  end
end