require 'spec_helper'

REQUEST_HASH = {epoch: "epoch", ecc: "eccentricity", per: "perihelion_distance", per_date: "perihelion_distance", om: "longitutde", w: "argument", i: "incliniation", H: "abs_magnitude"}

describe SkyMorph::OrbitRequest do
  let(:http_client) do
    client = double "http_client"
    client.stub(:get) { "Orbit response" }
    client
  end
  let(:request) { SkyMorph::OrbitRequest.new(*REQUEST_HASH.values, http_client) }

  it "generates a url" do
    expect(request.url).to eq 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=&NEAT=on&OE_EPOCH=%s&OE_EC=%s&OE_QR=%s&OE_TP=%s&OE_OM=%s&OE_W=%s&OE_IN=%s&OE_H=%s' % REQUEST_HASH.values
  end

  it "can make a request" do
    expect(request.fetch).to eq "Orbit response"
  end
end
