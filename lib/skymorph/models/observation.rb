require 'date'

module SkyMorph
  class Observation
    include Virtus

    attribute :key, String
    attribute :triplet, Array
    attribute :time, DateTime
    attribute :predicted_position, Hash
    attribute :observation_center, Hash
    attribute :magnitude, Float
    attribute :velocity, Hash
    attribute :offset, Float
    attribute :positional_error, Hash
    attribute :pixel_location, Hash

    def self.find(target)
      request = TargetRequest.new(target)
      ObservationTableParser.parse(request.fetch).map { |r| new r }
    end
  end
end
