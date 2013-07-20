require 'spec_helper'

feature "Nested resource" do
  background { sign_in }
  let!(:blog) { create(:blog) }

  scenario "add new nested resource item" do
    create_comment "Name for Commenty"
    page.should have_content "Name for Commenty"
  end

  scenario "edit nested resource item" do
    create_comment "Name for Commenty"
    update_comment "Name for Commenty", "New Commentz name"
    page.should have_content "New Commentz name"
  end

  scenario "Removes an nested resource item" do
    create_comment "Name for Commenty"
    remove_comment "Name for Commenty"
    page.should_not have_content "Name for Commenty"
  end

  def create_comment(title)
    visit brightcontent.blog_comments_path(blog)
    click_link "Create new Comment"
    fill_in "Text", with: title
    click_button "Create Comment"
  end

  def update_comment(title, new_title)
    within_comment_item(title) { click_link "Edit" }
    fill_in "Text", with: new_title
    click_button "Update Comment"
  end

  def remove_comment(title)
    within_comment_item(title) do
      click_link "Delete"
    end
  end

  def within_comment_item(title)
    comment = Comment.find_by_text!(title)
    within "#comment_#{comment.id}" do
      yield
    end
  end

end
