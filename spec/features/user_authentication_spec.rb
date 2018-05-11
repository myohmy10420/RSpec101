require "rails_helper"

RSpec.feature "User authentication" do
  describe "user sign in", :type => :feature do
    before :each do
      User.create(:email => "user@example.com", :password => "password")
    end

    it "sign_in the user" do
      new_session_page.sign_in "user@example.com", "password"

      expect(page).to have_content "user@example.com"
    end
  end

  scenario "user signs out" do
    create(:user, email: "user@example.com", password: "password")

    visit "/users/sign_in"

    within(".new_user") do
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
    end

    click_button "Log in"

    click_link "Logout"

    expect(page).not_to have_text "user@example.com"
  end

  private

  def home_page
    PageObjects::Pages::Home.new
  end

  def new_session_page
    home_page.go
    navbar.sign_in
  end

  def navbar
    PageObjects::Application::Navbar.new
  end
end
