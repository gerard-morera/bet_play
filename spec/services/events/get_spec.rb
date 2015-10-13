describe Events::Get do 
  let(:params)  { double 'params' }
  
  subject { described_class.new params }
  
  let(:content) do
    { "sports" => [{"id"=>100, "events" => [{"id"=>292582210,}
  end

  before do
    allow(params).to receive(:content).
      and_return(content)
  end

  describe 'call' do

  end
end