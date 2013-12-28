require 'spec_helper'

feature "Menu" do
  scenario "Shows default menu" do
    sign_in
    menu_should_not_have_link "Sessions"
  end

  scenario "Shows menu for extra resources" do
    sign_in
    menu_should_have_link "Blogs"
  end

  def menu_should_have_link(link_name)
    within ".js-menu" do
      page.should have_link link_name
    end
  end

  def menu_should_not_have_link(link_name)
    within ".js-menu" do
      page.should have_no_link link_name
    end
  end
end
