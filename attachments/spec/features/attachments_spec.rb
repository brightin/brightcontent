require 'spec_helper'

feature "Attachments" do
  it "show message if item is not saved" do
    sign_in
    click_link "Blogs"
    click_link "Create new Blog"
    page.should have_content "First save to enable uploads"
  end

  it "show upload form" do
    create(:blog)
    sign_in
    click_link "Blogs"
    click_link "Edit"
    page.should have_selector "#attachments"
  end
end
