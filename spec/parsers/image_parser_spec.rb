require 'spec_helper'

describe SkyMorph::ImageParser do
  let(:image) { SkyMorph::ImageParser.new.parse_html Fixtures.neat_image }

  it 'can parse image urls from html' do
    image.should be_a_kind_of SkyMorph::Image
  end

  it 'assigns filetype paths' do
    image.path(:fits).should =~ /\.fits$/
  end

  it 'raises a parse error on bad inputs' do
    expect { subject.parse_html('garbage') }.to raise_error SkyMorph::ParseError
  end
end