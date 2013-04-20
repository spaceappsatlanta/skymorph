require 'spec_helper'

describe SkyMorph::PositionRequest do
  let(:request) { SkyMorph::PositionRequest.new '08 36 15.06', '04 38 24.1', '2000-12-04 12:44:20', http_client_double('Position response') }

  it 'generates a url' do
    request.url.should == 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/obssel.pl?position=08 36 15.06,04 38 24.1&time=2000-12-04 12:44:20&time_delta=1'  
  end

  it 'can make a request' do
    request.fetch.should == 'Position response'
  end

  describe 'when passed value objects' do
    subject do
      ra   = SkyMorph::RightAscension.new(8, 36, 15.07)
      dec  = SkyMorph::Declination.new(4, 38, 24.2)
      time = Time.at(1366489924)
      SkyMorph::PositionRequest.new(ra, dec, time)
    end

    its(:url) { should == 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/obssel.pl?position=08 36 15.07,04 38 24.2&time=2013-04-20 16:32:04&time_delta=1' }
  end  
end