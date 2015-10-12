require 'rails_helper'

describe BetVictor::Content do

  subject { BetVictor::Content.new }

  let(:connection)    { double 'connection' }
  let(:response)      { double 'response' }
  let(:body_response) { double 'body_response' }

  describe 'response' do
    it 'returns its body' do
      expect(Faraday).to receive(:new).
        with(:url => 'http://www.betvictor.com').
        and_return(connection)

      expect(connection).to receive(:get).
        with('/live/en/live/list.json').
        and_return(response)

      expect(response).to receive(:body).
        and_return(body_response)

      expect(subject.get).to eq body_response
    end
  end
end