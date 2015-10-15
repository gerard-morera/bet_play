describe EventsParams do
  let(:raw_params) do 
    {"controller"=>"api/v1/events", "action"=>"index", "sport_id"=>"101"}
  end
  subject { described_class.new raw_params }

  describe 'sport_id' do
    it 'provides the id' do
      expect(subject.sport_id).to eq('101')
    end
  end
end