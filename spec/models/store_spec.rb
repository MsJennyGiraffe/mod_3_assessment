require "rails_helper"

describe Store do
  context "make_stores" do
    it "returns locations by zipcode" do
      VCR.use_cassette("locations by zipcode") do
        
