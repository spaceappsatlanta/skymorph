require 'spec_helper'

describe "Getting an image" do
  describe "by target" do
    let(:observations) { SkyMorph::Observation.find("J99TS7A") }

    it "should find multiple rows" do
      expect(observations.count).to be > 1
    end

    describe "Get image from key" do
      let(:observation) { observations.sample }
      let(:image_url) do
        image_request = SkyMorph::ImageRequest.new(observation.key)
        image_response = image_request.fetch
        image_parser = SkyMorph::ImageParser.new
        image_parser.parse_html(image_response)
      end


      it "Should be a url to an image" do
        expect(image_url).to start_with("http")
        expect(image_url).to end_with("gif")
      end
    end
  end

end
