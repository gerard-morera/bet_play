require 'rails_helper'

describe OutcomesSerializer do 
  let(:outcome_1) { double 'outcome_1', sport_id: 1, event_id: 2, description: "Barça", price: 5, price_decimal: 5.0 }
  let(:outcomes)  { [outcome_1] }
  
  let :expected_json do
    [
      { sport_id: 1, event_id: 2, description: "Barça", price: 5, price_decimal: 5.0 }
    ]
  end

  subject { described_class.new outcomes }

  describe 'call' do

    it 'builds json properly' do
      expect(subject.call).to eq expected_json
    end
  end
end