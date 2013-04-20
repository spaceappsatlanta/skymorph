require 'spec_helper'

describe SkyMorph::TargetRequest do
  let(:http_obj) { double("http_obj") }
  let(:http_factory) do
    http_factory = double("http_factory")
    http_factory.stub(:get) { "Test String" }
    http_factory.stub(:new) { http_obj }
    http_factory
  end
  let(:request) { SkyMorph::TargetRequest.new(target=nil, http_factory=http_factory) }

  describe "#fetch" do
    it { expect(request.fetch).to be_a_kind_of(String) }
  end

  describe "makes target search request" do
  end
end
