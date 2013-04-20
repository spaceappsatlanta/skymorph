require 'spec_helper'

describe SkyMorph::ImageParser do
  it 'can parse image urls from html' do
    subject.parse_html(Fixtures.neat_image).should =~ /^http.*\.gif$/
  end

  it 'raises a parse erorr on bad inputs' do
    expect { subject.parse_html('garbage') }.to raise_error SkyMorph::ParseError
  end
end