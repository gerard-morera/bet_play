describe NullSport do
  let(:randoom_value) { 'rv' }
  describe '[]' do
    it 'returns an empty array' do
      expect(subject.[](randoom_value)).to eq([])
    end
  end

  describe 'fetch' do
    it 'returns an empty array' do
      expect(subject.fetch(randoom_value)).to eq([])
    end
  end
end