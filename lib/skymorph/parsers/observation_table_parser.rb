require 'nokogiri'

module Skymorph
  class ObservationTableParser
    def self.parse(raw)
      doc = Nokogiri::HTML(raw)
      doc.xpath('/html/body/form/table[1]/tr').
        drop(2).map {|r| parse_row(r) }
    end

    def self.parse_row(row)
      key            = row.xpath('td[1]/input/@value').text
      observation_id = row.xpath('td[2]').text
      triplet        = triplet_to_boolean(row.xpath('td[3]').text)
      time           = DateTime.parse(row.xpath('td[4]').text)
      predicted_position = {
        right_ascension: parse_to_value_object(row.xpath('td[5]').text, RightAscension),
        declination: parse_to_value_object(row.xpath('td[6]').text, Declination)
      }
      observation_center = {
        right_ascension: parse_to_value_object(row.xpath('td[7]').text, RightAscension),
        declination: parse_to_value_object(row.xpath('td[8]').text, Declination)
      }
      magnitude = row.xpath('td[9]').text.to_f
      velocity = {
        west_east_degrees_per_hour: row.xpath('td[10]').text.to_f,
        south_north_degrees_per_hour: row.xpath('td[11]').text.to_f
      }
      offset = row.xpath('td[12]').text.to_f

      { key: key,
        observation_id: observation_id,
        triplet: triplet,
        time: time,
        predicted_position: predicted_position,
        observation_center: observation_center,
        magnitude: magnitude,
        velocity: velocity,
        offset: offset }
    end

    private
    def self.triplet_to_boolean(triplet)
      triplet.downcase == ?y
    end

    def self.parse_to_value_object(value, klass)
      args = value.split(/[[:space:]]/)
      args[0] = args[0].to_i
      args[1] = args[1].to_i
      args[2] = args[2].to_f
      klass.new(*args)
    end
  end
end
