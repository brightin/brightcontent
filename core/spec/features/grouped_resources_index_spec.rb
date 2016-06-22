require 'spec_helper'

feature "Grouped resources index" do
  background do
    sign_in
  end

  scenario "Visit the index view of resource" do
    given_authors_with_blogs(authors: 3, blogs: 2)
    given_page_sizes [2, 3]

    visit_grouped_blogs_page

    page_should_have_n_rows 2

    # 2 numbered links and previous/next links
    page.should have_css(".pagination.pages li", count: 4)
  end

  def visit_grouped_blogs_page
    click_link "Grouped blogs"
  end

  def given_authors_with_blogs(authors: 2, blogs: 5)
    authors.times do |num|
      create(:author_with_grouped_blogs, blogs_count: blogs, name: "Blogger #{num}")
    end
  end

  def given_page_sizes(sizes = [2, 6, 10])
    Brightcontent::GroupedBlogsController.class_eval { page_size_options sizes }
  end

  def page_should_have_n_rows(n)
    page.should have_css("tbody tr", :count => n)
  end
end
