require 'rails_helper'

describe Sports::Get do 
  subject { Sports::Get.new api_content}

  let(:api_content) { 
    {
      "version"=>"9", 
      "sports"=>[{ "id"=>101, "title"=>"Football", "whatever" => "9" }, 
        { "id"=>100, "title"=>"Tenis", "whatever" => "12" }]
    }
  }

  describe 'call' do
    context "when content hash has sports" do
      it 'filters the sports of the content' do
        expect(subject.call).to eq(
        [
          { "id" => 101, "title" => "Football" }, 
          { "id" => 100, "title" => "Tenis" }
        ])
      end
    end

    context "when content hash has not key sports" do
      let(:api_content) { double 'message' }
      
      before do 
        allow(api_content).to receive(:fetch)
      end
      
      it "return the content" do
        expect(subject.call).to eq(api_content)
      end
    end
  end
end
