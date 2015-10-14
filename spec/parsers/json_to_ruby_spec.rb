describe Parsers::JsonToRuby do
  let(:json) do
    "{\"version\":\"9\",\"sports\":[{\"id\":101,\"title\":\"Football\"},{\"id\":100,\"title\":\"Tenis\"}]}"
  end

  subject { described_class.new json }

  it "converts json to ruby object" do
    expect(subject.call).to eq({"version"=>"9", "sports"=>[{"id"=>101, "title"=>"Football"}, {"id"=>100, "title"=>"Tenis"}]})
  end
end