require 'nokogiri'

module Skymorph
  class ObservationTableParser
    def self.parse(raw)
      doc = Nokogiri::HTML(raw)
      binding.pry
      #this should get us the first table more cleanly and then select all rows
      doc.xpath('/html/body/form/table[1]/tr')
    end
  end
end
