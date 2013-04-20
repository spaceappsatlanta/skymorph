module Fixtures
  def self.one_tile_html
    File.read('spec/fixtures/one_tile.html')
  end

  def self.two_tile_html
    File.read('spec/fixtures/two_tile.html')
  end

  def self.neat_image
    # From http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobsdisp.pl?Headers_NEAT=|Observation|Time|ObjRA|ObjDec|Plt%20RA|Plt%20Dec|Magnitude|V_RA|V_Dec|E_Maj|E_Min|E_PosAng|x|y|&Check_NEAT=|001204124410|51882.530787037|129.062741402712|4.64001695570385|128.337645|4.0726|20.70|-4.28|-11.08|n.a.|n.a.|n.a.|71.9154214757038|547.287989060186|y|&Npixel=500&Singlets='on'&Scaling='Log'&Extremum='Dft'&OverSize=300&OverScale=0.5
    File.read('spec/fixtures/neat_image.html')
  end
end
