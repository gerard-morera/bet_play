describe NullEvent do
  let(:randoom_value) { 'd' }
  describe '[]' do
    it 'returns an empty array' do
      expect(subject.[](randoom_value)).to eq([])
    end
  end
end