require "rails_helper"

describe BestBuyService do
  context "find_by_location" do
    it "returns locations by zipcode" do
      VCR.use_cassette("locations by zipcode") do
        # And I should see stores within 25 miles of 80202
        # And I should see a message that says "17 Total Stores"
        zipcode = 80202
        distance = 25
        best_buy_service = BestBuyService.new
        locations = best_buy_service.find_by_location(zipcode, distance)
        expect(locations["total"]).to eq(17)
      end
    end
  end

  # context "find_by_id" do
  #   it "returns locations by store id" do
  #     VCR.use_cassette("locations by id") do
  #       store_id = "1224"
  #       best_buy_service = BestBuyService.new
  #       store = best_buy_service.find_by_id(store_id)
  #       byebug
  #       expect(store["storeId"]).to eq(store_id)
  #     end
  #   end
  # end
end
