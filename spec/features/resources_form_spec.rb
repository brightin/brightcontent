require 'spec_helper'

feature "Resources form" do
  before do
    valid_login
    @blog = create(:blog)
    visit brightcontent.blog_url(@blog)
  end

  it "should show the edit form" do
    page.should have_content "Edit"
    save_and_open_page
    page.should have_field "Name"
    page.should have_field "Body"
  end
end
