require 'rails_helper'

describe Sport do
  let(:data) do
    { "id"=>101, "title"=>"Football" }
  end

  subject { described_class.new data }

  describe "id" do
    it "returns the id or default" do
      expect(subject.id).to eq 101
    end 
  end

  describe "id" do
    it "returns the id or default" do
      expect(subject.title).to eq "Football"
    end 
  end
end
