require 'nokogiri'

module SkyMorph
  class TileParser
    def parse_html(input)
      doc = Nokogiri::HTML(input)
      tile_content = doc.xpath('//body/script').first.content
      captures = tile_content.scan(/^x\['(\w+)'\]='(.+)'$/)
      captures.map { |key, value| { key.to_sym => value } }.reduce Hash.new, :merge
    end
  end
end
