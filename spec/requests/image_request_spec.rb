require 'spec_helper'

KEY   = '|001204124410|51882.530787037|129.062741402712|4.64001695570385|128.337645|4.0726|20.70|-4.28|-11.08|n.a.|n.a.|n.a.|71.9154214757038|547.287989060186|y|'
CERES = '|960612131820|50246.5545138889|244.581324998925|-18.763833474331|244.954665|-18.56389|7.31|-32.08|-4.65|0.05|0.04|-19.63|2930.79899380174|2557.29333913111|y|'

describe SkyMorph::ImageRequest do
  describe 'requesting one image' do
    let(:request) { SkyMorph::ImageRequest.new KEY, http_client_double('Image response') }

    it 'generates a url' do
      request.url.should == "http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobsdisp.pl?Headers_NEAT=%7CObservation%7CTime%7CObjRA%7CObjDec%7CPlt+RA%7CPlt+Dec%7CMagnitude%7CV_RA%7CV_Dec%7CE_Maj%7CE_Min%7CE_PosAng%7Cx%7Cy%7C&Check_NEAT=%7C001204124410%7C51882.530787037%7C129.062741402712%7C4.64001695570385%7C128.337645%7C4.0726%7C20.70%7C-4.28%7C-11.08%7Cn.a.%7Cn.a.%7Cn.a.%7C71.9154214757038%7C547.287989060186%7Cy%7C&Npixel=500&Singlets=on&Scaling=Log&Extremum=Dft&OverSize=300&OverScale=0.5"
    end

    it 'can make a request' do
      request.fetch.should == 'Image response'
    end
  end

  describe 'requesting multiple images' do
    let(:request) { SkyMorph::ImageRequest.new [KEY, CERES], http_client_double('Images response') }

    it 'sends a request' do
      request.http_client.should_receive(:perform).with('http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobsdisp.pl?Headers_NEAT=%7CObservation%7CTime%7CObjRA%7CObjDec%7CPlt+RA%7CPlt+Dec%7CMagnitude%7CV_RA%7CV_Dec%7CE_Maj%7CE_Min%7CE_PosAng%7Cx%7Cy%7C&Check_NEAT=%7C001204124410%7C51882.530787037%7C129.062741402712%7C4.64001695570385%7C128.337645%7C4.0726%7C20.70%7C-4.28%7C-11.08%7Cn.a.%7Cn.a.%7Cn.a.%7C71.9154214757038%7C547.287989060186%7Cy%7C&Check_NEAT=%7C960612131820%7C50246.5545138889%7C244.581324998925%7C-18.763833474331%7C244.954665%7C-18.56389%7C7.31%7C-32.08%7C-4.65%7C0.05%7C0.04%7C-19.63%7C2930.79899380174%7C2557.29333913111%7Cy%7C&Npixel=500&Singlets=on&Scaling=Log&Extremum=Dft&OverSize=300&OverScale=0.5')
      request.fetch
    end
  end
end
