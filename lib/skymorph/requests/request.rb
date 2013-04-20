module SkyMorph
  class Request

    def fetch
      @http_client.get URI URI.encode url
    end
  end
end
