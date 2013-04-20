require 'spec_helper'

describe SkyMorph::ImageParser do
  it 'can parse image urls from html' do
    subject.parse_html(Fixtures.neat_image).should =~ /\.gif$/
  end
end