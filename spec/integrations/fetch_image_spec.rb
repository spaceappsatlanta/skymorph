require 'spec_helper'

describe 'Getting an image' do
  describe 'by target' do
    let(:observations) { SkyMorph::Observation.find('J99TS7A') }

    it 'should find multiple rows' do
      expect(observations.count).to be > 1
    end

    describe 'Get image from key' do
      let(:observation) { observations.sample }
      let(:images) { observation.images }

      it 'Should return images' do
        expect(images.first).to be_a_kind_of SkyMorph::Image
      end
    end
  end
end
