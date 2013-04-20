module SkyMorph
  class PositionRequest < Request
    attr_accessor :ra, :dec, :time

    @@request_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/obssel.pl?position=%s,%s&time=%s&time_delta=1'

    def initialize(ra, dec, time, http_client=Curl::Easy)
      @http_client = http_client
      self.ra   = ra
      self.dec  = dec
      self.time = time
    end

    def url
      @@request_url % [ra, dec, time]
    end
  end
end