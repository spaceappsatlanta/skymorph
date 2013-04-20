require 'nokogiri'

module SkyMorph
  module TileParser
    class SkyView
      # Takes in raw HTML from the skyview system
      # Reads each script tag and then returns the contents of the tile object in hash format
      # Returns all hash objects in an array formant
      def parse_tile_result(input)
        doc = Nokogiri::HTML(input)
        tiles = []

        doc.xpath('//body/script').each do |script|
          tile_data = script.content.scan(/^x\['(\w+)'\]='(.+)'$/)

          unless tile_data.empty?
            tiles << tile_data.map { |key, value| { key.to_sym => value } }.reduce({}, :merge)
          end
        end

        return tiles
      end
    end
  end
end
