require 'spec_helper'

feature "Pages" do
  scenario "visit specific page" do
    @page = create :page, :name => "Test titel"
    visit "/test-titel"
    page.should have_content @page.name
  end
end
