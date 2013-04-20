require 'spec_helper'
require 'net/http'

describe SkyMorph::TargetRequest do
  let(:request) { SkyMorph::TargetRequest.new(target="foo_target", net_http_double) }

  describe "#fetch" do
    it "can make a request" do
      expect(request.fetch).to eq "Http response"
    end
  end

  describe "makes target search request" do
    it "generates a url" do
      expect(request.url).to eq 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=foo_target&NEAT=on&OE_EPOCH=&OE_EC=&OE_QR=&OE_TP=&OE_OM=&OE_W=&OE_IN=&OE_H='
    end
  end
end
