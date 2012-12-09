require 'spec_helper'

feature "Pages" do
  background do
    @page = create :page , name: "Homepage"
  end

  scenario "visit root page" do
    visit root_path
    page.should have_content @page.name
  end

  scenario "visit specific page" do
    @page2 = create :page, name: "Test page"
    visit "/test-page"
    page.should have_content @page2.name
  end
end
