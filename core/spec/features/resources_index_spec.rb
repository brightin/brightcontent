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

  scenario "Filter by name or comments text" do
    given_3_blog_items_and_a_comment
    visit_blogs_page
    fill_in "Find", with: "oo"
    click_button "Search"
    page_should_have_n_rows 2
  end

  scenario "Filter by exclude_inactive scope" do
    given_an_active_and_inactive_blog
    visit_blogs_page
    page_should_have_n_rows 2
    check "Exclude inactive"
    click_button "Search"
    page_should_have_n_rows 1
  end

  scenario "shows no page size options" do
    given_blog_items
    visit_blogs_page
    page.should_not have_css(".pagination.page-sizes")
  end

  context "with adjustable pagination page size" do
    scenario "shows pagination size options" do
      given_page_sizes
      given_blog_items
      visit_blogs_page

      page.should have_css(".pagination.page-sizes li", count: 3)
      within ".pagination.page-sizes .active" do
        page.should have_content "2"
      end
    end

    scenario "shows 2 items" do
      given_page_sizes
      given_blog_items
      visit_blogs_page
      page_should_have_n_rows 2
    end

    scenario "can switch to different page size" do
      given_page_sizes [3, 6, 9]
      given_blog_items
      visit_blogs_page
      within ".pagination.page-sizes" do
        click_link "6"
      end

      page_should_have_n_rows 6
    end

    scenario "adjusts active page to page size" do
      given_page_sizes [2, 4, 8]
      given_blog_items 16
      visit_blogs_page

      within ".pagination.pages" do
        click_link "4"
      end

      within ".pagination.page-sizes" do
        click_link "4"
      end

      within ".pagination.pages .active" do
        page.should have_content "2"
      end
    end

    scenario "retains page size after applying filter" do
      given_page_sizes [2, 4, 8]
      given_blog_items 9
      visit_blogs_page
      within ".pagination.page-sizes" do
        click_link "4"
      end

      fill_in "Name", with: "Blog"
      click_button "Search"

      within ".pagination.page-sizes .active" do
        page.should have_content "4"
      end
    end

    scenario "retains filter after applying page size" do
      given_page_sizes [2, 4, 8]
      given_blog_items 14
      visit_blogs_page
      fill_in "Name", with: "Blog 1"
      click_button "Search"

      # 3 numbered links and previous/next links
      page.should have_css(".pagination.pages li", count: 5)

      within ".pagination.page-sizes" do
        click_link "4"
      end

      # 2 numbered links and previous/next links
      page.should have_css(".pagination.pages li", count: 4)
    end

    scenario "hides page size options when there is only a single page" do
      given_page_sizes [5, 6, 7]
      given_blog_items 4
      visit_blogs_page

      page.should_not have_css(".pagination.page-sizes")
    end

    context "with invalid entries in page sizes list" do
      scenario "shows the valid options" do
        given_page_sizes ["a", 2, 5, nil, 8]
        given_blog_items
        visit_blogs_page

        page.should have_css(".pagination.page-sizes li", count: 3)
      end
    end
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

  def given_3_blog_items_and_a_comment
    create :blog, name: "Foo"
    create :blog, name: "Bar"
    create :comment, text: "Doodles"
  end

  def given_an_active_and_inactive_blog
    create :blog, name: "Foo", active: false
    create :blog, name: "Bar", active: true
  end

  def given_page_sizes(sizes = [2, 6, 10])
    Brightcontent::BlogsController.class_eval { page_size_options sizes }
  end

  def given_blog_items(num = 10)
    num.times { |num| create [:blog, :featured_blog].sample, name: "Blog #{num}" }
  end
end
