require 'spec_helper'

describe SkyMorph::ImageParser do
  describe 'parsing a single image' do
    let(:image) { SkyMorph::ImageParser.new.parse_html(Fixtures.neat_image).first }

    it 'can parse image urls from html' do
      image.should be_a_kind_of SkyMorph::Image
    end

    it 'assigns a .gif path' do
      image.path.should =~ /\.gif$/
    end

    it 'assigns a .fits path' do
      image.fits_path.should =~ /\.fits$/
    end

    it 'raises a parse error on bad inputs' do
      expect { subject.parse_html('garbage') }.to raise_error SkyMorph::ParseError
    end
  end

  describe 'parsing mulitple images' do
    let(:images) { SkyMorph::ImageParser.new.parse_html Fixtures.neat_images_Ceres }

    it 'parses an array of images' do
      images.each { |image| image.should be_a_kind_of SkyMorph::Image }
    end

    it 'returns multiple images' do
      images.should have(5).elements
    end
  end
end