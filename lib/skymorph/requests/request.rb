module SkyMorph
  class Request
    def fetch
      uri  = URI URI.encode url
      html = StringIO.new

      @http_client.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri.request_uri
        http.request request do |response|
          response.read_body do |chunk|
            html.puts chunk
          end
        end
      end
      html.string
    end
  end
end
