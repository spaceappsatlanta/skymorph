require_relative '../../lib/skymorph/parsers/observation_table_parser'

describe Skymorph::ObservationTableParser do
  subject { Skymorph::ObservationTableParser }

  describe '::parse' do
    let(:result) { subject.parse(Fixtures.observation_table_j99ts7a) }
    let(:ceres_result) { subject.parse(Fixtures.observation_table_ceres) }

    it 'returns a hash' do
      expect(result).to be_kind_of(Array)
    end

    it 'returns the correct number of rows' do
      expect(result.count).to eq(65)
    end

    it 'fetches the key' do
      expect(result.first[:key]).to eq('|001204124410|51882.530787037|129.062741402712|4.64001695570385|128.337645|4.0726|20.70|-4.28|-11.08|n.a.|n.a.|n.a.|71.9154214757038|547.287989060186|y|')
    end

    it 'fetches the observation_id' do
      expect(result.first[:observation_id]).to eq('001204124410')
    end

    it 'fetches the triplet' do
      expect(result.first[:triplet]).to be(true)
    end

    it 'fetches the time' do
      expect(result.first[:time]).to eq(DateTime.new(2000, 12, 04, 12, 44, 20))
    end

    it 'fetches the predicted_position' do
      expect(result.first[:predicted_position]).to eq(
        right_ascension:  Skymorph::RightAscension.new(8, 36, 15.06),
        declination:      Skymorph::Declination.new(4, 38, 24.1)
      )
    end

    it 'fetches to observation_center' do
      expect(result.first[:observation_center]).to eq(
        right_ascension:  Skymorph::RightAscension.new(8, 33, 21.03),
        declination:      Skymorph::Declination.new(4, 4, 21.4)
      )
    end

    it 'fetches the magnitude' do
      expect(result.first[:magnitude]).to eq(20.70)
    end

    it 'fetches velocity' do
      expect(result.first[:velocity]).to eq(
        west_east_degrees_per_hour: -4.28,
        south_north_degrees_per_hour: -11.08
      )
    end

    it 'fetches offset' do
      expect(result.first[:offset]).to eq(55.14)
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
    end
  end
end
