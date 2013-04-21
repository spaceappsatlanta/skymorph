require "spec_helper"

describe SkyMorph::Observation do
  describe "#find_by_target" do
    let(:observations) { SkyMorph::Observation.find_by_target "Ceres" }

    it "should find observations" do
      expect(observations.count).to be > 1
    end
    describe "first observation" do
      let(:observation) { observations.first }
      it "should have correct key" do
        expect(observation.key).to eq "|960612124155|50246.529224537|244.586842294571|-18.7630733314539|244.964565|-18.55884|7.30|-32.09|-4.65|0.05|0.04|-19.63|2942.15100272039|2568.62273640486|y|"
      end

      it "should have correct observation id" do
        expect(observation.observation_id).to eq "960612124155"
      end
    end
  end

  describe "#find_by_position" do
    let(:right_ascension) { SkyMorph::RightAscension.new(8, 36, 15.07) }
    let(:declination) { SkyMorph::Declination.new(4, 38, 24.2) }
    let(:time) { Time.new(2013, 04, 20, 16, 32, 04) }
    let(:observations) { SkyMorph::Observation.find_by_target(right_ascension, declination, time) }

    it "should find observations" do
      expect(observations.count).to be > 1
    end

    describe "first observation" do
      let(:observation) { observations.first }

      it "should have correct key" do
        expect(observation.key).to eq "001204124410|51882.530787037|20|128.337645|4.0726|128.31027|4.06057|4080|4080|0|001204124410a|001204125916a|001204131418a|9.8e-10|2040|2060|2040|2040|6.525e-06|-40.7616|0.00125003|-0.0170697|-69.7721|0.00161338|0.0168178"
      end

      it "should have correct observation id" do
        expect(observation.observation_id).to eq "001204124410"
      end

      it "should have correct right ascension" do
        expect(observation.right_ascension).to eq right_ascension
      end

      it "should have correct declination" do
        expect(observation.declination).to eq declination
      end
    end
  end
end
