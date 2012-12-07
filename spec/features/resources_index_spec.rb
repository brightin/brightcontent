require 'spec_helper'

feature "Resources index" do
  background do
    valid_login
  end

  context "Single item" do
    background do
      @blog = create :blog
      click_link "Blogs"
    end

    scenario "View the index of the resource" do
      within "#overview" do
        ["Blogs", "Name", "Body", "Edit", @blog.name, @blog.body].each do |name|
          page.should have_content name
        end
        page.should have_no_content "created_at"
      end
    end
  end

  context "Multiple items" do
    background do
      40.times { create :blog }
      click_link "Blogs"
    end

    scenario "Multiple pages for items with more than 30 items" do
      page.should have_css("tbody tr", :count => 30)
      click_link "Next"
      page.should have_css("tbody tr", :count => 10)
    end

    scenario "Editable paginate count" do
      class Brightcontent::BlogsController ; per_page 10 ; end
      click_link "Blogs"
      page.should have_css("tbody tr", :count => 10)
    end
  end

end
