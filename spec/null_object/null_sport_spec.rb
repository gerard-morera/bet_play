require 'rails_helper'

describe NullSport do
  let(:randoom_value) { 'rv' }
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
end