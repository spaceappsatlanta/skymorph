module SkyMorph
  class OrbitRequest < Request
    attr_accessor :epoch, :ecc, :per, :per_date, :om, :w, :i, :H

    #@@request_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=&NEAT=on&OE_EPOCH=%s&OE_EC=%s&OE_QR=%s&OE_TP=%s&OE_OM=%s&OE_W=%s&OE_IN=%s&OE_H=%s'
    @@request_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=&NEAT=on&%s'
    
    def initialize(epoch, ecc, per, per_date, om, w, i, h, http_client=Curl::Easy)
      @http_client = http_client
      self.epoch      = epoch
      self.ecc        = ecc
      self.per        = per
      self.per_date   = per_date
      self.om         = om
      self.w          = w
      self.i          = i
      self.H          = h
    end

    def url
      @@request_url % [ URI.encode_www_form(
        'OE_EPOCH'   => @epoch,
        'OE_EC'      => @ecc,
        'OE_QR'      => @per,
        'OE_TP'      => @per_date,
        'OE_OM'      => @om,
        'OE_W'       => @w,
        'OE_IN'      => @i,
        'OE_H'       => @H
      )]
    end
  end
end
