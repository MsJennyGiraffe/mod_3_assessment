# And I should see exactly 15 results

require "rails_helper"

RSpec.feature "user can search" do
  scenario "a user can enter a zipcode and find all stores within a 25 mile radius" do
    VCR.use_cassette("locations_by_zipcode") do
      visit "/"
      fill_in :search, with: "80202"
      click_button "Submit"
      expect(page).to have_content("17 Total Stores")
      expect(page).to have_content("Cherry Creek Shopping Center")
      expect(page).to have_content("Denver")
      expect(page).to have_content("3.25 miles")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Mobile")
    end
  end
end
