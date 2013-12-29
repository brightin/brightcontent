require 'spec_helper'

feature "Resources index" do
  background do
    sign_in
  end

  scenario "Visit the index view of resource" do
    visit_blogs_page
    page_should_have_valid_table
  end

  scenario "Multiple pages for items with more than 30 items" do
    given_31_blog_items
    visit_blogs_page
    page.should have_css("tbody tr", :count => 30)
    click_link "Next"
    page.should have_css("tbody tr", :count => 1)
  end

  scenario "Editable paginate count" do
    given_10_per_page
    given_31_blog_items
    visit_blogs_page
    page.should have_css("tbody tr", :count => 10)
  end

  def visit_blogs_page
    click_link "Blogs"
  end

  def page_should_have_valid_table
    within ".panel" do
      page.should have_content "Blogs"
      page.should have_content "Name"
      page.should have_content "Body"
      page.should have_no_content "created_at"
    end
  end

  def given_31_blog_items
    31.times { create :blog }
  end

  def given_10_per_page
    Brightcontent::BlogsController.class_eval { per_page 10 }
  end
end
