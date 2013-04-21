require 'uri'

module SkyMorph
  class ImageRequest < Request
    attr_accessor :headers, :keys, :npixel, :singlets, :triplets, :scaling, :extremum, :skyview, :skyover, :oversize, :overscale

    @@request_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobsdisp.pl?%s'

    def initialize(keys, http_client=Curl::Easy)
      @http_client   = http_client
      self.keys      = keys
      self.headers   = '|Observation|Time|ObjRA|ObjDec|Plt RA|Plt Dec|Magnitude|V_RA|V_Dec|E_Maj|E_Min|E_PosAng|x|y|'
      self.npixel    = 500
      self.singlets  = 'on'
      self.triplets  = 'off'
      self.scaling   = 'Log'
      self.extremum  = 'Dft'
      self.skyview   = 'off'
      self.skyover   = 'off'
      self.oversize  = 300
      self.overscale = 0.5
    end

    def url
      @@request_url % [ URI.encode_www_form(
        'Headers_NEAT' => @headers,
        'Check_NEAT'   => @keys,
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
