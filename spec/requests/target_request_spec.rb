require 'spec_helper'
require 'net/http'

describe SkyMorph::TargetRequest do
  let(:http_client_double) do
    obj = double("http_client")
    obj.stub(:get) { "foo" }
    obj
  end

  let(:request) { SkyMorph::TargetRequest.new(target="foo_target", http_client=http_client_double) }

  describe "#fetch" do
    it "can make a request" do
      expect(request.fetch).to eq "foo"
    end
  end

  describe "makes target search request" do
    it "should use http object" do
      http_client_double.should_receive(:get)
      request.fetch
    end

    it "generates a url" do
      expect(request.url).to eq 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=foo_target&NEAT=on&OE_EPOCH=&OE_EC=&OE_QR=&OE_TP=&OE_OM=&OE_W=&OE_IN=&OE_H='
    end
  end
end
