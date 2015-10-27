require 'rails_helper'

describe BetVictor::Content do
  subject { BetVictor::Content.new parser_class: parser_class}

  let(:connection)      { double 'connection' }
  let(:response)        { double 'response' }
  let(:body_response)   { double 'body_response' }
  let(:parsed_response) { double 'parsed_response' }
  let(:parse_instance) { double 'parse_instance' }
  let(:parser_class)    { double 'parser_class' }

  describe 'response' do
    it 'returns its body parsed' do
      expect(Faraday).to receive(:new).
        with(:url => 'http://www.betvictor.com').
        and_return(connection)
      expect(connection).to receive(:get).
        with('/live/en/live/list.json').
        and_return(response)
      expect(response).to receive(:body).
        and_return(body_response)
      
      expect(parser_class).to receive(:new).with(body_response).
        and_return(parse_instance)
      expect(parse_instance).to receive(:call).
        and_return(parsed_response)

      expect(subject.get).to eq parsed_response
    end
  end
end