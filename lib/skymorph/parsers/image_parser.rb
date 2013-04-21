module SkyMorph
  class ImageParser
    @@url_base = 'http://skyview.gsfc.nasa.gov'

    def parse_html(input)
      input.scan(/href='(.*?\.fits)'.*?img src='(.*?)'/mi).
        map { |fits, src| Image.new(:path => "#{@@url_base}#{src}", :fits_path => "#{@@url_base}#{fits}") }.
        tap { |result| raise SkyMorph::ParseError.new "Could not parse any images" if result.empty? }
    end
  end
end