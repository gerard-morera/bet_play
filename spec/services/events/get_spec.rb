require 'rails_helper'

describe Events::Get do 
  let(:params)         { double 'params' }
  let(:content)        { double 'content' }
  let(:sport_class)    { double 'sport_class'}
  let(:id)             { 5 }

  subject { described_class.new params, content, sport_class: sport_class }

  let(:selected_sport) { double 'selected_sport', call: sport_content}
  let(:sport_content) do 
    { "id"=>100, "events" => [{"event_id"=>292582210, "title" => "Barça-Madrid", "is_virtual" => "false"}]}
  end

  before do
    allow(sport_class).to receive(:new).with(params, content).
      and_return(selected_sport)

    allow(selected_sport).to receive(:call).
      and_return(sport_content)

    allow(params).to receive(:sport_id).
      and_return(id)
  end

  describe 'call' do
    context "with external API working" do
      context 'when there is aport key' do
        it 'filters the hash of events' do 
          expect(subject.call).to eq([{"event_id"=>292582210, "title" => "Barça-Madrid", "is_virtual"=>"false", "sport_id"=>5}])
        end
      end

      context 'when sport nil' do
        let(:sport_content) { nil }

        it 'shows that there are not live events' do
          expect(subject.call).to eq([])
        end
      end
    end

    context "with external API not working" do
      let(:sport_content) { double 'message'}
      let(:sport)         { sport_content }

      before do
        allow(sport).to receive(:fetch).
          with("events")
      end

      it 'returns the sport hash' do
        expect(subject.call).to eq(sport_content)
      end
    end
  end
end