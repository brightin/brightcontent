require 'spec_helper'

feature "PagesForm" do
  background do
    @page = create :page , name: "Homepage"
  end

  scenario "Adds a new item" do
    sign_in

    visit brightcontent.pages_url
    click_link "Create new page"
    fill_in "Name", with: "Name for page"
    select "Homepage", from: "page_parent_id"
    click_button "Create Page"

    page.should have_content "Page was successfully created."
    page.should have_content "Name for page"
  end
end
