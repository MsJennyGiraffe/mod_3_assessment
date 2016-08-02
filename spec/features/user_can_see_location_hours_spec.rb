# The name will be a link in the next story:
#
# As a user
# After I have searched a zip code for stores
# When I click the name of a store
# Then my current path should be "/stores/:store_id"
# I should see the store name, store type and address with city, state and zip
# I should see an unordered list of the store hours in the following format:
#   * Mon: 10am-9pm
#   * Tue: 10am-9pm
#   * Wed: 10am-9pm
#   * Thurs: 10am-9pm
#   * Fri: 10am-9pm
#   * Sat: 10am-9pm
#   * Sun: 11am-7pm

require "rails_helper"

RSpec.feature "user can see location store hours" do
  scenario "a user clicks on a link of a store to get store hours" do
    VCR.use_cassette("locations_by_zipcode") do
      visit "/"
      fill_in :search, with: "80202"
      click_button "Submit"
      click_link("Cherry Creek Shopping Center")
      expect(current_path).to eq("/stores/1224")
      expect(page).to have_content("Cherry Creek Shopping Center")
      expect(page).to have_content("Address, Denver, 80123")
      expect(page).to have_content("* Mon: 10am-9pm (hours)")
    end
  end
end
