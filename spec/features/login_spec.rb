require 'spec_helper'

feature "Login" do
  background do
    @user = create(:user)
  end
 
  scenario "Login with invalid credentials" do
    visit "/admin"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "wrongpass"
    click_button "Login"
    page.should have_content "invalid"
  end

  scenario "Login with valid credentials" do
    login
    page.should have_content "Pages"
  end

  scenario "Logout" do
    login
    click_link "Logout"
    page.should have_content "Please sign in"
  end

  private

  def login
    visit "/admin"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Login"
  end
end
