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

  context "find_by_location" do
    it "returns locations by zipcode" do
      VCR.use_cassette("store hours") do
        store_id = 2740
        best_buy_service = BestBuyService.new
        hours = best_buy_service.find_by_id(store_id)
        expect(hours["stores"].first["hoursAmPm"]).to eq("Mon: 10am-9pm; Tue: 10am-9pm; Wed: 10am-9pm; Thurs: 10am-9pm; Fri: 10am-9pm; Sat: 10am-9pm; Sun: 11am-6pm")
      end
    end
  end
end
