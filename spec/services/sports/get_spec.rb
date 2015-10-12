describe Sports::Get do 
  subject { Sports::Get.new api_content}

  let(:api_content) { 
    "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\"},{\"id\":100,\"title\":\"Tenis\"}]}"
  }

  describe 'call' do
    it 'filters the sports of the content' do
      expect(subject.call).to eq ["Football", "Tenis"]
    end
  end
end
