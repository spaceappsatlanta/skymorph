require 'nokogiri'

module Skymorph
  class ObservationTableParser
    def self.parse(raw)
      doc = Nokogiri::HTML(raw)
      doc.xpath('/html/body/form/table[1]/tr').
        drop(2).map {|r| parse_row(r) }
    end

    def self.parse_row(row)
      key = row.xpath('td[1]/input/@value').to_s

      { key: key }
    end
  end
end
