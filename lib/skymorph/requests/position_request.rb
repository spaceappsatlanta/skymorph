module SkyMorph
  class PositionRequest < Request

    @@search_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/obssel.pl?position=%s,%s&time=%s&time_delta=1'

    def initialize(ra, dec, time, http_client=Net::HTTP)
      @ra, @dec, @time = ra, dec, time
      @http_client = http_client
    end

    def url
      @@search_url % [@ra, @dec, @time]
    end
  end
end