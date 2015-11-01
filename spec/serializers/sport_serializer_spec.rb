require 'rails_helper'

describe SportsSerializer do 
  let(:sport_1) { double 'sport_1', :id => 1, :title => "Football" }
  let(:sport_2) { double 'sport_2', :id => 2, :title => "Petanca" }
  let(:sports)  { [sport_1, sport_2] }
  
  let :expected_json do
    [
      {:id => 1, :title => "Football"},
      {:id => 2, :title => "Petanca"},
    ]
  end

  subject { described_class.new sports }

  describe 'call' do

    it 'builds json properly' do
      expect(subject.call).to eq expected_json
    end
  end
end