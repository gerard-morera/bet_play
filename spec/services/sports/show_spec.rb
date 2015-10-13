describe Sports::Show do
  let(:params) { double 'params' }

  subject { described_class.new params }

  let(:id) { 100 }
  let(:content) do
    { 
      "sports" => [{"id"=>100, "events" => [{"id"=>292582210}]}, 
                   {"id" =>200, "title" => "Baseball"}]
    }
  end


  before do
    allow(params).to receive(:content).
      and_return(content)
    allow(params).to receive(:id).
    and_return(id)
  end

  describe 'call' do
    it '' do
      expect(subject.call).to eq([{ "id"=>100, "events" => [{"id"=>292582210}] }])
    end
  end
end