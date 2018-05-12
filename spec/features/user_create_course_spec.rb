require "rails_helper"

describe "user create course", :type => :feature do
  before :each do
    User.create(:email => "user@example.com", :password => "password")
  end

  scenario "valid" do
    course = build_stubbed(:course)

    course_form.create(course.title, course.description)

    expect(page).to have_text(course.title)
  end

  scenario "invalid" do
    course_form.create("", "")
    expect(page).to have_text("Add a course")
  end

  private

  def course_form
    new_session_page.sign_in "user@example.com", "password"
    home_page.go
    home_page.add_course
  end

  def new_session_page
    home_page.go
    navbar.sign_in
  end

  def home_page
    PageObjects::Pages::Home.new
  end

  def course_page
    PageObjects::Pages::Course.new
  end

  def navbar
    PageObjects::Application::Navbar.new
  end
end
