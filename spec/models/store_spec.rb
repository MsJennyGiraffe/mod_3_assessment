require "rails_helper"

describe Store do
  context "make_stores" do
    it "returns locations by zipcode" do
      VCR.use_cassette("locations by zipcode") do
        zipcode = 80202
        distance = 25
        stores = Store.make_stores(zipcode, distance)

        expect(stores.count).to eq(17)
        expect(stores.first.name).to eq("Cherry Creek Shopping Center")
        expect(stores.first.type).to eq("Mobile")
        expect(stores.first.id).to eq(2740)
        expect(stores.last.city).to eq("Boulder")
        expect(stores.last.distance).to eq(22.79)
        expect(stores.last.phone_number).to eq("303-938-2889")
      end
    end
  end
end
