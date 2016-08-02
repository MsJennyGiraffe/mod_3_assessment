require "rails_helper"

describe BestBuyService do
  context "find_by_location" do
    it "returns locations by zipcode" do
      VCR.use_casette("locations by zipcode") do
        # And I should see stores within 25 miles of 80202
        # And I should see a message that says "17 Total Stores"
        zipcode = 80202
        radius = 25
        locations = BestBuyService.find_by_location(zipcode, radius)
        expect(locations.count).to eq(17)
      end
    end
  end
end
