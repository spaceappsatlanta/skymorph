require_relative '../../lib/skymorph/parsers/observation_table_parser'

describe SkyMorph::ObservationTableParser do
  subject { SkyMorph::ObservationTableParser }

  describe '::parse' do
    let(:result) { subject.parse(Fixtures.observation_table_j99ts7a) }
    let(:ceres_result) { subject.parse(Fixtures.observation_table_ceres) }

    it 'returns a hash' do
      expect(result).to be_kind_of(Array)
      expect(ceres_result).to be_kind_of(Array)
    end

    it 'returns the correct number of rows' do
      expect(result.count).to eq(65)
      expect(ceres_result.count).to eq(70)
    end

    it 'fetches the key' do
      expect(result.first[:key]).to eq('|001204124410|51882.530787037|129.062741402712|4.64001695570385|128.337645|4.0726|20.70|-4.28|-11.08|n.a.|n.a.|n.a.|71.9154214757038|547.287989060186|y|')
      expect(ceres_result.first[:key]).to eq('|960612124155|50246.529224537|244.586842294571|-18.7630733314539|244.964565|-18.55884|7.30|-32.09|-4.65|0.05|0.04|-19.63|2942.15100272039|2568.62273640486|y|')
    end

    it 'fetches the observation_id' do
      expect(result.first[:observation_id]).to eq('001204124410')
      expect(ceres_result.first[:observation_id]).to eq('960612124155')
    end

    it 'fetches the triplet' do
      expect(result.first[:triplet]).to be(true)
      expect(ceres_result.first[:triplet]).to be(true)
    end

    it 'fetches the time' do
      expect(result.first[:time]).to eq(DateTime.new(2000, 12, 04, 12, 44, 20))
      expect(ceres_result.first[:time]).to eq(DateTime.new(1996, 06, 12, 12, 42, 05))
    end

    it 'fetches the predicted_position' do
      expect(result.first[:predicted_position]).to eq(
        right_ascension:  SkyMorph::RightAscension.new(8, 36, 15.06),
        declination:      SkyMorph::Declination.new(4, 38, 24.1)
      )

      expect(ceres_result.first[:predicted_position]).to eq(
        right_ascension:  SkyMorph::RightAscension.new(16, 18, 20.84),
        declination:      SkyMorph::Declination.new(-18, 45, 47.1)
      )
    end

    it 'fetches to observation_center' do
      expect(result.first[:observation_center]).to eq(
        right_ascension:  SkyMorph::RightAscension.new(8, 33, 21.03),
        declination:      SkyMorph::Declination.new(4, 4, 21.4)
      )

      expect(ceres_result.first[:observation_center]).to eq(
        right_ascension:  SkyMorph::RightAscension.new(16, 19, 51.50),
        declination:      SkyMorph::Declination.new(-18, 33, 31.8)
      )
    end

    it 'fetches the magnitude' do
      expect(result.first[:magnitude]).to eq(20.70)
      expect(ceres_result.first[:magnitude]).to eq(7.30)
    end

    it 'fetches velocity' do
      expect(result.first[:velocity]).to eq(
        west_east_degrees_per_hour: -4.28,
        south_north_degrees_per_hour: -11.08
      )

      expect(ceres_result.first[:velocity]).to eq(
        west_east_degrees_per_hour: -32.09,
        south_north_degrees_per_hour: -4.65
      )
    end

    it 'fetches offset' do
      expect(result.first[:offset]).to eq(55.14)
      expect(ceres_result.first[:offset]).to eq(24.72)
    end

    it 'fetches positional_error' do
      expect(result.first[:positional_error]).to eq(
        major: nil,
        minor: nil,
        position_angle: nil
      )

      expect(ceres_result.first[:positional_error]).to eq(
        major: 0.05,
        minor: 0.04,
        position_angle: -19.63
      )
    end

    it 'fetches pixel_location' do
      expect(result.first[:pixel_location]).to eq(
        x: 71.92,
        y: 547.29
      )

      expect(ceres_result.first[:pixel_location]).to eq(
        x: 2942.15,
        y: 2568.62
        )
    end
  end
end
