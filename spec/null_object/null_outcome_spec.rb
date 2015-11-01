require 'rails_helper'

describe NullOutcome do
  let(:value) { double 'value' }
  
  describe 'outcome_id' do
    it 'returns an empty array' do
      expect(subject.outcome_id).to eq("no information")
    end
  end

  describe 'description' do
    it 'returns an empty array' do
      expect(subject.description).to eq("no information")
    end
  end

  describe 'sport_id' do
    it 'returns an empty array' do
      expect(subject.sport_id).to eq("no information")
    end
  end

  describe 'price' do
    it 'returns an empty array' do
      expect(subject.price).to eq("no information")
    end
  end

  describe 'decimal_price' do
    it 'returns an empty array' do
      expect(subject.decimal_price).to eq("no information")
    end
  end

  describe 'has_key?' do
    it 'returns an empty array' do
      expect(subject.has_key?(value)).to eq(false)
    end
  end

  describe 'each_with_object' do
    it 'returns an empty array' do
      expect(subject.each_with_object(value)).to be_instance_of(described_class)
    end
  end
end