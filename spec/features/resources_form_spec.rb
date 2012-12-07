require 'spec_helper'

feature "Resources form" do
  background do
    valid_login
    @blog = create(:blog)
    visit brightcontent.blogs_url
  end

  scenario "shows edit form" do
    click_link "Edit"
    page.should have_content "Edit"
    page.should have_field "Name"
    page.should have_field "Body"
  end

  scenario "add a item" do
    click_link "Add"
    fill_in "Name", with: "test-name"
    fill_in "Body", with: "test-body"
    click_button "Create Blog"
    page.should have_content "test-name"
    page.should have_content "test-body"
  end

  scenario "edit a item" do
    click_link "Edit"
    fill_in "Name", with: "edit-test-name"
    fill_in "Body", with: "edit-test-body"
    click_button "Update Blog"
    page.should have_content "edit-test-name"
    page.should have_content "edit-test-body"
  end

end
