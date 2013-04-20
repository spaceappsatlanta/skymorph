module SkyMorph
  class Declination
    attr_accessor :degrees, :minutes, :seconds

    def initialize(degrees, minutes, seconds)
      self.degrees = degrees
      self.minutes = minutes
      self.seconds = seconds
    end

    def ==(other)
      [self.degrees, self.minutes, self.seconds] ==
        [other.degrees, other.minutes, other.seconds]
    end

    def eql?(other)
      self == other
    end

    def hash
      [other.degrees, other.minutes, other.seconds].hash
    end

    def to_s
      [degrees, minutes, seconds].map { |t| t.to_s.rjust(2, '0') }.join ' '
    end
  end
end
