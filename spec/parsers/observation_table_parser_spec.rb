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

    it 'fetches the key' do
      expect(result.first[:key]).to eq('|001204124410|51882.530787037|129.062741402712|4.64001695570385|128.337645|4.0726|20.70|-4.28|-11.08|n.a.|n.a.|n.a.|71.9154214757038|547.287989060186|y|')
    end
  end
end
