require 'rails_helper'

describe Errors::Status do
  let(:status) { double 'status' }

  subject { described_class.new status }

  describe 'default_message' do
    it 'returns the default message' do
      expect(subject.default_message).to eq("Error in the server status: #{status}")
    end
  end
end