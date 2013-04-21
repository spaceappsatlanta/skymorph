require 'virtus'

module SkyMorph
  class Image
    include Virtus

    attribute :path, String
    attribute :fits_path, String
  end
end