require_relative '../../lib/skymorph/models/image'

describe SkyMorph::Image do
  subject { SkyMorph::Image.new :gif_path => 'path.gif', :fits_path => 'path.fits' }

  [:gif, :fits].each do |fmt|
    it "can look up .#{fmt}s" do
      subject.path(fmt).should =~ /\.#{fmt}$/
    end
  end
end