require 'spec_helper'

feature "Menu" do
  scenario "Shows menu for extra resources" do
    sign_in
    menu_should_have_link "Pages"
  end

  def menu_should_have_link(link_name)
    within ".js-menu" do
      page.should have_link link_name
    end
  end
end
