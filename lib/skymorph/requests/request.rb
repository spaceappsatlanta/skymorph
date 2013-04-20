module SkyMorph
  class Request

    def fetch
      @http_client.get URI url
    end
  end
end
