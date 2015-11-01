require 'rails_helper'

describe Outcome do
  let(:data)   { {"outcome_id"=>"9979", "description"=>"Barça", "price"=>4/10, "price_decimal"=>0.40} }
  let(:params) { double 'params' }

  subject { described_class.new data, params }

  describe 'price_decimal' do
    it "gets the price_decimal" do
      expect(subject.price_decimal).to eq(0.40) 
    end
  end

  describe 'description' do
    it "gets the description" do
      expect(subject.description).to eq("Barça") 
    end
  end

  describe 'price' do
    it "gets the price" do
      expect(subject.price).to eq(4/10) 
    end
  end 

  describe 'sport_id' do
    it "gets the sport_id" do
      expect(params).to receive(:sport_id)

      subject.sport_id
    end
  end 

  describe 'event_id' do
    it "gets the event_id" do
      expect(params).to receive(:event_id)

      subject.event_id
    end
  end 
end