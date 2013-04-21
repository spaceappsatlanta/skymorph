require 'virtus'

module SkyMorph
  class Image
    include Virtus

    attribute :gif_path, String
    attribute :fits_path, String

    def path type
      send :"#{type}_path"
    end
  end
end