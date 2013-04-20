require_relative '../../lib/skymorph/parsers/observation_table_parser'

describe Skymorph::ObservationTableParser do
  subject { Skymorph::ObservationTableParser }

  describe '::parse' do
    let(:result) { subject.parse(Fixtures.observation_table_j99ts7a) }

    it 'returns a hash' do
      expect(result).to be_kind_of(Array)
    end

    it 'returns the correct number of rows' do
      expect(result.count).to eq(65)
    end
  end
end
