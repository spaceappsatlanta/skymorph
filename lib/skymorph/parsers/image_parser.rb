module SkyMorph
  class ImageParser
    @@url_base = 'http://skyview.gsfc.nasa.gov'

    def self.parse(input)
      input.scan(/href='(.*?\.fits)'.*?img src='(.*?)'/mi).
        map { |fits, src| { :path => abspath(src), :fits_path => abspath(fits) } }.
        tap { |result| raise SkyMorph::ParseError.new 'Could not parse any images' if result.empty? }
    end

    def self.abspath(path)
      path.start_with?('http') ? path : "#{@@url_base}#{path}"
    end
  end
end
