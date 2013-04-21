module SkyMorph
  class ImageParser
    @@url_base = 'http://skyview.gsfc.nasa.gov'

    def parse_html(input)
      if input =~ /href='(.*\.fits)'.*?img src='(.*\.gif)'/
        fits, gif = $1, $2
        Image.new :gif_path => "#{@@url_base}#{gif}", :fits_path => "#{@@url_base}#{fits}"
      else
        raise SkyMorph::ParseError.new "Could not parse images"
      end
    end
  end
end