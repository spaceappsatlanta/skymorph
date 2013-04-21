require 'date'

module SkyMorph
  class Observation
    include Virtus

    attribute :key, String
    attribute :observation_id, String
    attribute :triplet, Boolean
    attribute :time, DateTime
    attribute :predicted_position, Hash
    attribute :observation_center, Hash
    attribute :magnitude, Float
    attribute :velocity, Hash
    attribute :offset, Float
    attribute :positional_error, Hash
    attribute :pixel_location, Hash

    def self.find_by_target(target)
      request = TargetRequest.new(target)
      ObservationTableParser.parse(request.fetch).map { |r| new r }
    end

    def self.find_by_position(right_ascension, declination, time)
      request = PositionRequest.new(right_ascension, declination, time)
      ObservationTableParser.parse(request.fetch).map { |r| new r }
    end

    def self.find_by_orbit(epoch, eccentricity, per, per_date, om, w, i, h)
      request = OrbitRequest.new(epoch, eccentricity, per, per_date, om, w, i, h)
      ObservationTableParser.parse(request.fetch).map { |r| new r }
    end

    def images
      response = ImageRequest.new(key).fetch
      ImageParser.parse(response).map { |i| Image.new i }
    end
  end
end
