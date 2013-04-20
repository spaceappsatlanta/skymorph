require 'curb'

module SkyMorph
  class Request
    def fetch
      @http_client.perform(url).body_str
    end
  end
end
