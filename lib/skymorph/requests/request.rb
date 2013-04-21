require 'curb'

module SkyMorph
  class Request
    attr_accessor :http_client

    def fetch
      @http_client.perform(url).body_str
    end
  end
end
