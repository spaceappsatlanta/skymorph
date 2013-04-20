require 'net/http'

module SkyMorph
  class TargetRequest
    attr_accessor :target

    @@search_target_url = 'http://skyview.gsfc.nasa.gov/cgi-bin/skymorph/mobssel.pl?target=%s&NEAT=on&OE_EPOCH=&OE_EC=&OE_QR=&OE_TP=&OE_OM=&OE_W=&OE_IN=&OE_H='

    def initialize(target=nil, http_client=Net::HTTP)
      @http_client = http_client
      self.target = target
    end

    def fetch
      @http_client.get(@@search_target_url)
    end
  end
end
