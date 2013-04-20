module Fixtures
  module SkyView
    def self.one_tile_html
      File.read('spec/fixtures/skyview/one_tile.html')
    end

    def self.two_tile_html
      File.read('spec/fixtures/skyview/two_tiles.html')
    end
  end
end
