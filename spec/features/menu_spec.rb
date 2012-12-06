require 'spec_helper'

feature "Menu" do
  background do
    @user = create(:user)
    visit "/admin"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button "Login"
  end

  scenario "Shows default menu" do
    within "#menu" do
      page.should have_link "Pages"
      page.should have_no_link "Sessions"
    end
  end

  scenario "Shows menu for extra resources" do
    within "#menu" do
      page.should have_link "Blogs"
    end
  end
end
