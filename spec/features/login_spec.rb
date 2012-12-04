require 'spec_helper'

feature "Login" do
  scenario "Visit admin without being logged in" do
    visit "/admin"
    page.should have_content("Login")
  end
end
