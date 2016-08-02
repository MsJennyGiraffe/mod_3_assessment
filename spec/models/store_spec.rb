require "rails_helper"

describe Store do
  context "make_stores" do
    it "returns locations by zipcode" do
      VCR.use_cassette("locations by zipcode") do
        zipcode = 80202
        distance = 25
        stores = Store.make_stores(zipcode, distance)

        expect(stores.count).to eq(17)
      end
    end
  end
end
