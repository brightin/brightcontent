require 'spec_helper'

feature "Resources form" do

  scenario "Adds a new item" do
    sign_in
    create_blog "Name for blogitem"
    page.should have_content "Name for blogitem"
  end

  scenario "Edits an existing item" do
    sign_in
    create_blog "Name for blogitem"
    update_blog "Name for blogitem", "New blog name"
    page.should have_content "New blog name"
  end

  scenario "Removes an item" do
    sign_in
    create_blog "Name for blogitem"
    remove_blog "Name for blogitem"
    page.should_not have_content "Name for blogitem"
  end

  def create_blog(title)
    visit brightcontent.blogs_url
    click_link "Create new blog"
    fill_in "Name", with: title
    click_button "Create Blog"
  end

  def update_blog(title, new_title)
    within_blog_item(title) { click_link "Edit" }
    fill_in "Name", with: new_title
    click_button "Update Blog"
  end

  def remove_blog(title)
    within_blog_item(title) do
      click_link "Delete"
    end
  end

  def within_blog_item(title)
    blog = Blog.find_by_name!(title)
    within "#blog_#{blog.id}" do
      yield
    end
  end

end
