require 'spec_helper'

feature "Pages index" do

  background do
    sign_in
    create(:page, name: "Test page")
  end

  scenario "click on edit page" do
    click_link "Pages"
    page.find(:css, '.controls .edit').click
    page.should have_content "Edit page"
  end

  scenario "click on delete page" do
    click_link "Pages"
    page.find(:css, '.controls .delete').click
    page.should_not have_content "Test page"
    page.should have_content "successfully"
  end

end
