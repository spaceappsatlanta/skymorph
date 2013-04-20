require 'curb'

module SkyMorph
  class Request
    def fetch
      Curl::Easy.perform(url).body_str
    end
  end
end
