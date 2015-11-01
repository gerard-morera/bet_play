require 'rails_helper'


describe NullSport do
  let(:value) { double 'value' }
  
  describe 'id' do
    it 'returns an empty array' do
      expect(subject.id).to eq("no information")
    end
  end

  describe 'title' do
    it 'returns an empty array' do
      expect(subject.title).to eq("no information")
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