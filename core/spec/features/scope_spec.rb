require 'spec_helper'

feature "Scope" do

  background do
    2.times { create(:blog, name: "Featured", featured: true) }
    2.times { create(:blog, name: "Notfeatured", featured: false) }
    sign_in
    visit_blogs_page
  end

  scenario "Default shows all items" do
    page.should have_content "Featured"
    page.should have_content "Notfeatured"
  end

  scenario "filter featured only" do
    click_link "Featured"
    page.should have_content "Featured"
    page.should_not have_content "Notfeatured"
  end

  def visit_blogs_page
    click_link "Blogs"
  end

end
