require 'net/http'

module SkyMorph
  class TargetRequest
    attr_accessor :target

    @@search_target_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=%s&NEAT=on&OE_EPOCH=&OE_EC=&OE_QR=&OE_TP=&OE_OM=&OE_W=&OE_IN=&OE_H='

    def initialize(target=nil, http_factory=Net::Http)
      @http_factory = http_factory
      self.target = target
    end

    def fetch
      "foo"
    end
  end
end
