require "rails_helper"

RSpec.describe "Home" do
  scenario "has navbar element" do
    visit root_url

    expect(page).to have_css "nav.navbar"
  end
end
