require 'spec_helper'

describe SkyMorph::TileParser do
  let(:parser) { SkyMorph::TileParser.new }

  describe "parse single tile" do
    let(:parse_result) { parser.parse_html(Fixtures.one_tile_html) }

    it { expect(parse_result).to_not eq nil }
    it { expect(parse_result.is_a? Hash).to eq true }
  end
end
