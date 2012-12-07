require 'spec_helper'

feature "Resources index" do
  before do
    valid_login
    @blog = create :blog
  end

  scenario "View the index of the resource" do
    click_link "Blogs"
    page.should have_link "Logout"
    within "#overview" do
      ["Blogs", "Name", "Body", "Edit", @blog.name, @blog.body].each do |name|
        page.should have_content name
      end
      page.should have_no_content "created_at"
    end
  end

  scenario "Multiple pages for items with more than 30 items" do
    40.times { create :blog }
    click_link "Blogs"
    page.should have_css("tbody tr", :count => 30)
    click_link "Next"
    page.should have_css("tbody tr", :count => 11)
  end

end
