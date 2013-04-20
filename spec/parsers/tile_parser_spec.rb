require 'spec_helper'

describe SkyMorph::TileParser do
  let(:parser) { SkyMorph::TileParser.new }

  describe "parse single tile" do
    let(:parse_result) { parser.parse_tile_result(Fixtures.one_tile_html) }
    let(:tile) { parse_result.first }

    it { expect(parse_result).to_not eq nil }
    it { expect(parse_result).to be_a_kind_of(Array) }
    it { expect(tile.keys.length).to eq 93 }
    it { expect(tile[:output]).to eq "../tempspace/fits/skv4473613526489" }
  end

  describe "parse multiple tiles" do
    let(:parse_result) { parser.parse_tile_result(Fixtures.two_tile_html) }

    it { expect(parse_result).to_not eq nil }
    it { expect(parse_result).to be_a_kind_of(Array) }
    it { expect(parse_result.length).to eq 2 }

  end
end
