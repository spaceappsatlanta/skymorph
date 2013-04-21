require 'spec_helper'

describe SkyMorph::TargetRequest do
  let(:request) { SkyMorph::TargetRequest.new(target='foo_target', http_client_double('Target response')) }

  describe '#fetch' do
    it 'can make a request' do
      expect(request.fetch).to eq 'Target response'
    end
  end

  describe 'makes target search request' do
    it 'generates a url' do
      expect(request.url).to eq 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=foo_target&NEAT=on&OE_EPOCH=&OE_EC=&OE_QR=&OE_TP=&OE_OM=&OE_W=&OE_IN=&OE_H='
    end
  end
end
