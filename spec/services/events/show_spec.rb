require 'rails_helper'

describe Events::Show do
  let(:params) { double 'params' }
  let(:id) { 9834943 }
  let(:sport) do
    { 
      "events" => [{"event_id"=>9834943, "title"=>"Barça v Madrid", "outcomes" => [{"id"=>292582210}]}, 
                   {"event_id"=>9349834, "title" => "Atletico v Deportivo"}]
    }
  end

  subject { described_class.new params, sport }

  before do
    allow(params).to receive(:event_id).
    and_return(id)
  end

  describe 'call' do
    context 'when there is a event key' do
      before do
        allow(sport).to receive(:has_key?).
          with("events").and_return(true)
      end

      context 'and id matches' do
        it 'returns the event with matching id' do
          expect(subject.call).to eq({"event_id"=>9834943, "title"=>"Barça v Madrid", "outcomes" => [{"id"=>292582210}]})
        end
      end

      context 'and id does not match' do
        let(:id) { 3434943 }
        
        it 'returns a null event' do
          expect(subject.call).to be_instance_of(NullEvent)
        end
      end

      context 'when there is not a event key' do
        before do
          allow(sport).to receive(:has_key?).
            with("events").and_return(false)
        end

        it 'returns a null sport' do
          expect(subject.call).to be_instance_of(NullEvent)
        end
      end
    end
  end
end