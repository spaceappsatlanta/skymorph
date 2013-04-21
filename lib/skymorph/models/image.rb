require 'virtus'

module SkyMorph
  class Image
    include Virtus

    attribute :path, String
    attribute :fits_path, String

    def self.find(*keys)
      response = ImageRequest.new(keys).fetch
      ImageParser.parse(response).map { |i| Image.new i }
    end
  end
end