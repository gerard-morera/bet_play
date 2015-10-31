require 'rails_helper'

describe Sports::Get do 
  let(:content) { double 'content' }
  let(:sports)   { [{}] }

  subject { described_class.new content}

  describe 'call' do
    context "when content hash has sports" do
      before do
        allow(content).to receive(:has_key?).
          with("sports").and_return(true)

        allow(content).to receive(:fetch).
          with("sports").and_return(sports)
      end

      it 'builds the sport model' do
        expect(Sport).to receive(:new)

        subject.call
      end
    end

    context "when content hash has not key sports" do
      before do
        allow(content).to receive(:has_key?).
          with("sports").and_return(false)
      end
    
      it "builds an error model" do
        expect(Errors::Status).to receive(:new).
          with(content)
          
        subject.call
      end
    end
  end
end
