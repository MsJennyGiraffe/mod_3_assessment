require 'rails_helper'

RSpec.feature "display items" do
  scenario "it reaches the root page" do
    visit "/"

    within('h1') do
      expect(page).to have_content("Items")
    end
  end
end
