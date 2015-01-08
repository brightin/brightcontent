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
    page_should_have_n_rows 10
  end

  scenario "Filter by 'featured'" do
    given_31_blog_items
    visit_blogs_page
    select "true", from: "Featured"
    click_button "Search"
    page_should_have_n_rows 6
  end

  scenario "Filter by author" do
    given_20_blogs_from_two_authors
    visit_blogs_page
    select "Bob", from: "Author"
    click_button "Search"
    page_should_have_n_rows 9
  end

  scenario "Filter by name" do
    given_2_blog_items_with_different_names
    visit_blogs_page
    fill_in "Name", with: "oo"
    click_button "Search"
    page_should_have_n_rows 1
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

  def page_should_have_n_rows(n)
    page.should have_css("tbody tr", :count => n)
  end

  def given_31_blog_items
    25.times { create :blog }
    6.times { create :featured_blog }
  end

  def given_20_blogs_from_two_authors
    create(:author_with_blogs, blogs_count: 11, name: "Alice")
    create(:author_with_blogs, blogs_count: 9, name: "Bob")
  end

  def given_10_per_page
    Brightcontent::BlogsController.class_eval { per_page 10 }
  end

  def given_2_blog_items_with_different_names
    create :blog, name: "Foo"
    create :blog, name: "Bar"
  end
end
