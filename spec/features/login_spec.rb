require 'spec_helper'

feature "Login" do

  scenario "Login with invalid credentials" do
    sign_in_with_invalid_email
    page.should have_content "invalid"
  end

  scenario "Login with valid credentials" do
    sign_in
    page.should have_content "Admin users"
  end

  scenario "User logs out" do
    sign_in
    click_link "Logout"
    page.should have_content "Please sign in"
  end

  def sign_in_with_invalid_email
    @user = create(:admin_user)
    visit "/admin"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "wrongpass"
    click_button "Login"
  end

end
