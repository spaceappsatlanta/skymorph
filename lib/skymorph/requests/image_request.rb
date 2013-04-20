require 'net/http'
require 'uri'

module SkyMorph
  class ImageRequest < Request
    attr_accessor :headers, :key, :npixel, :singlets, :scaling, :extremum, :oversize, :overscale

    def initialize key, http_client=Net::HTTP
      @http_client  = http_client
      @key          = key
      @headers      = '|Observation|Time|ObjRA|ObjDec|Plt RA|Plt Dec|Magnitude|V_RA|V_Dec|E_Maj|E_Min|E_PosAng|x|y|'
      @npixel       = 500
      @singlets     = 'on'
      @scaling      = 'Log'
      @extremum     = 'Dft'
      @oversize     = 300
      @overscale    = 0.5
    end

    def url
      params = URI.encode_www_form({
        'Headers_NEAT' => @headers,
        'Check_NEAT'   => @key,
        'Npixel'       => @npixel,
        'Singlets'     => @singlets,
        'Scaling'      => @scaling,
        'Extremum'     => @extremum,
        'OverSize'     => @oversize,
        'OverScale'    => @overscale
      })
      "http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobsdisp.pl?#{params}"
    end
  end
end
