require 'rails_helper'

describe Sports::Show do
  let(:params) { double 'params' }
  let(:id) { 100 }
  let(:content) do
    { 
      "sports" => [{"id"=>100, "events" => [{"id"=>292582210}]}, 
                   {"id" =>200, "title" => "Baseball"}]
    }
  end

  subject { described_class.new params, content }

  before do
    allow(params).to receive(:sport_id).
    and_return(id)
  end

  describe 'call' do

    context 'when there is a sport key' do
      before do
        allow(content).to receive(:has_key?).
          with("sports").and_return(true)
      end

      context 'and id matches' do
        it 'returns the sport with matching id' do
          expect(subject.call).to eq({ "id"=>100, "events" => [{"id"=>292582210}] })
        end
      end

      context 'and id does not match' do
        let(:id) { 600 }
        
        it 'returns a null sport' do
          expect(subject.call).to be_instance_of(NullSport)
        end
      end
    end
    context 'when there is not a sport key' do
      before do
        allow(content).to receive(:has_key?).
          with("sports").and_return(false)
      end

      it 'returns a null sport' do
        expect(subject.call).to be_instance_of(NullSport)
      end
    end
  end
end