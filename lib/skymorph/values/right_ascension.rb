module SkyMorph
  class RightAscension
    attr_accessor :hours, :minutes, :seconds

    def initialize(hours, minutes, seconds)
      self.hours   = hours
      self.minutes = minutes
      self.seconds = seconds
    end

    def ==(other)
      [other.hours, other.minutes, other.seconds] ==
        [self.hours, self.minutes, self.seconds]
    end

    def hash
      [self.hours, self.minutes, self.seconds].hash
    end

    def eql?(other)
      self == other
    end

    def to_s
      [hours, minutes, seconds].map { |t| t.to_s.rjust(2, '0') }.join ' '
    end
  end
end
