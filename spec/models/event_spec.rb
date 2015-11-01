require 'rails_helper'

describe Event do
  let(:data)   { {"event_id"=>8738238, "title"=>"Barça v Madrid", "is_virtual"=> false } }
  let(:params) { double 'params' }

  subject { described_class.new data, params }

  describe 'event_id' do
    it "gets the id" do
      expect(subject.event_id).to eq(8738238) 
    end
  end

  describe 'is_virtual' do
    it "gets the is_virtual" do
      expect(subject.is_virtual).to eq(false) 
    end
  end

  describe 'title' do
    it "gets the title" do
      expect(subject.title).to eq("Barça v Madrid") 
    end
  end 

  describe 'sport_id' do
    it "gets the id" do
      expect(params).to receive(:sport_id)

      subject.sport_id
    end
  end 
end