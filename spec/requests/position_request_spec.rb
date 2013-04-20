require 'spec_helper'

describe SkyMorph::PositionRequest do
  let(:http_client) do
    obj = double('http_client')
    obj.stub(:get) { 'Position response' }
    obj
  end
  let(:request) { SkyMorph::PositionRequest.new '08 36 15.06', '04 38 24.1', '2000-12-04 12:44:20', http_client }

  it 'generates a url' do
    request.url.should == 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/obssel.pl?position=08 36 15.06,04 38 24.1&time=2000-12-04 12:44:20&time_delta=1'  
  end

  it 'can make a request' do
    request.fetch.should == 'Position response'
  end
end