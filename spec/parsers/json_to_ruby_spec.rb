require 'rails_helper'

describe Parsers::JsonToRuby do
  let(:json) do
    "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\"},{\"id\":100,\"title\":\"Tenis\"}]}"
  end

  subject { described_class.new json }

  context "with a valid json" do
    
    it "converts json to ruby object" do
      expect(subject.call).to eq({"version"=>"9", "sports"=>[{"id"=>101, "title"=>"Football"}, {"id"=>100, "title"=>"Tenis"}]})
    end
  end
  
  context "with an invalid json" do    
    let(:json) {''}

    it "sends an error message" do 
      expect(subject.call). to eq({"error_message"=>"We are having problems connecting to the server"})
    end
  end
end
