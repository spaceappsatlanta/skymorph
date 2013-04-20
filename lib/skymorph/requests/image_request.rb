require 'uri'

module SkyMorph
  class ImageRequest < Request
    attr_accessor :headers, :key, :npixel, :singlets, :scaling, :extremum, :oversize, :overscale

    @@request_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobsdisp.pl?%s'

    def initialize(key, http_client=Curl::Easy)
      @http_client  = http_client
      self.key       = key
      self.headers   = '|Observation|Time|ObjRA|ObjDec|Plt RA|Plt Dec|Magnitude|V_RA|V_Dec|E_Maj|E_Min|E_PosAng|x|y|'
      self.npixel    = 500
      self.singlets  = 'on'
      self.scaling   = 'Log'
      self.extremum  = 'Dft'
      self.oversize  = 300
      self.overscale = 0.5
    end

    def url
      @@request_url % [ URI.encode_www_form(
        'Headers_NEAT' => @headers,
        'Check_NEAT'   => @key,
        'Npixel'       => @npixel,
        'Singlets'     => @singlets,
        'Scaling'      => @scaling,
        'Extremum'     => @extremum,
        'OverSize'     => @oversize,
        'OverScale'    => @overscale
      ) ]
    end
  end
end
