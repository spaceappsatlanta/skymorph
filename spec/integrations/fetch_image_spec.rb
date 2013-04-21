require 'spec_helper'

describe "Getting an image" do
  describe "Search by target" do
    before(:all) do
      target_request = SkyMorph::TargetRequest.new("J99TS7A")
      target_response = target_request.fetch
      @parsed_table = SkyMorph::ObservationTableParser.parse(target_response)
    end

    it "should find multiple rows" do
      expect(@parsed_table.count).to be > 1
    end

    it "random row should contain key" do
      expect(@parsed_table.sample).to include(:key)
    end

    describe "Get image from key" do
      before(:all) do
        key = @parsed_table.sample[:key]
        image_request = SkyMorph::ImageRequest.new(key)
        image_response = image_request.fetch
        image_parser = SkyMorph::ImageParser.new
        @images = image_parser.parse_html(image_response)
      end


      it "Should return images" do
        expect(@images.first).to be_a_kind_of SkyMorph::Image
      end
    end
  end
end
