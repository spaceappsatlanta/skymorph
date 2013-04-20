module SkyMorph
  class ImageParser
    @@url_base = 'http://skyview.gsfc.nasa.gov'

    def parse_html(input)
      if input =~ /img src='(.*?)'/
        "#{@@url_base}#{$1}"
      end
    end
  end
end