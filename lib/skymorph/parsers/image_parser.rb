module SkyMorph
  class ImageParser
    def parse_html(input)
      input =~ /img src='(.*?)'/ && $1
    end
  end
end