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
      page.should have_content "Blogs"
      page.should have_content "name"
      page.should have_content "body"
      page.should have_no_content "created_at"
      page.should have_content @blog.name
      page.should have_content @blog.body
    end
  end

end
