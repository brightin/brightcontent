require 'spec_helper'

feature "Login" do
  scenario "Login with invalid credentials" do
    visit "/admin"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "wrongpass"
    click_button "Login"
    page.should have_content "invalid"
  end

  scenario "Login with invalid credentials" do
    visit "/admin"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    click_button "Login"
    page.should have_content "Pagina's"
  end
end
