require 'nokogiri'

module Skymorph
  class ObservationTableParser
    def self.parse(raw)
      doc = Nokogiri::HTML(raw)
      doc.xpath('/html/body/form/table[1]/tr').drop(2)
    end
  end
end
