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
    it { expect(request.fetch).to be_a_kind_of(String) }
  end

  describe "makes target search request" do
    it "should use http object" do
      http_client_double.should_receive(:get)
      request.fetch
    end

    it "should request target" do
      http_client_double.should_receive(:get) do |request|
        TargetRequest.search_target_url
      end
    end
  end
end
