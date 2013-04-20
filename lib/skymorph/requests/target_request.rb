module SkyMorph
  class TargetRequest < Request
    attr_accessor :target

    @@request_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=%s&NEAT=on&OE_EPOCH=&OE_EC=&OE_QR=&OE_TP=&OE_OM=&OE_W=&OE_IN=&OE_H='

    def initialize(target=nil, http_client=Curl::Easy)
      @http_client = http_client
      self.target = target
    end

    def url
      @@request_url % [target]
    end
  end
end
