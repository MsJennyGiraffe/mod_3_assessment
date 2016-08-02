# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number and store type for each of the 15 results

require "rails_helper"

RSpec.feature "user can search" do
  scenario "a user can enter a zipcode and find all stores within a 25 mile radius" do
    visit "/"
    fill_in :search, with: "80202"
    click_button "Submit"
    # save_and_open_page
    expect(page).to have_content("17 Total Stores")
    expect(page).to have_content("15 results")
    expect(page).to have_content(store.name)
    expect(page).to have_content(store.city)
    expect(page).to have_content(store.distance)
    expect(page).to have_content(store.phone_number)
    expect(page).to have_content(store.store_type)
  end
end
