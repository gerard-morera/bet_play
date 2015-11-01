require 'rails_helper'

describe BetVictor::Content do
  subject { described_class.new parser_class: parser_class}

  let(:connection)      { double 'connection' }
  let(:response)        { double 'response' }
  let(:body_response)   { double 'body_response' }
  let(:parsed_response) { double 'parsed_response' }
  let(:parse_instance)  { double 'parse_instance' }
  let(:parser_class)    { double 'parser_class' }

  describe 'response' do

    describe 'get' do
      before do
        allow(Faraday).to receive(:new).
          with(:url => 'http://www.betvictor.com').
          and_return(connection)
        allow(connection).to receive(:get).
          with('/live/en/live/list.json').
          and_return(response)
        allow(response).to receive(:status).
          and_return(status)
        allow(response).to receive(:body).
          and_return(body_response)
        allow(parser_class).to receive(:new).with(body_response).
          and_return(parse_instance)
        allow(parse_instance).to receive(:call).
          and_return(parsed_response)  
      end

      context 'when status is 200' do
        let(:status) {200}

        it 'returns its body parsed' do
          expect(subject.get).to eq parsed_response
        end
      end

      context 'when status is not 200' do
        let(:status) {400}

        it 'raises an error' do
          expect{subject.get}.to raise_error(StatusError)
        end
      end
    end
  end
end