require 'spec_helper'

module Brightcontent
  describe Page do
    describe "validations" do
      it "validates persence of name" do
        build_stubbed(:page, name: nil).should_not be_valid
      end
    end

    describe "slugs" do
      context "first page" do
        subject { create(:page, name: "Homepage") }
        its(:slug) { should be_empty }
      end

      context "second page" do
        let!(:homepage) { create(:page, name: "Homepage") }

        it "generates slug for siblings" do
          create(:page, name: "About us").slug.should eq "about-us"
        end

        it "creates a slug for children" do
          create(:page, name: "About us", parent: homepage).slug.should eq "homepage/about-us"
        end

        it "persists the slug" do
          page = create(:page, name: "About us", parent: homepage).reload
          page.slug.should eq "homepage/about-us"
        end
      end
    end

    describe ".homepage?" do
      subject { create(:page, name: "Homepage") }

      context "is homepage" do
        it { should be_homepage }
      end

      context "is not homepage" do
        before { create(:page) }
        subject { create(:page, name: "Second_page") }
        it { should_not be_homepage }
      end
    end

    describe "root_parent_children" do
      it "returns the children if page is root element" do
        root, child = build(:page), build(:page)
        root.children << child
        root.root_parent_children.should == [child]
      end

      it "returns the children of parent if page has parent" do
        root, page, child = create(:page), create(:page), create(:page)
        root.children << page
        page.children << child
        page.root_parent_children.should == [page]
      end

      it "returns the children of root parent if page has multiple parent" do
        root1, root2, page = create(:page), create(:page), create(:page)
        root1.children << root2
        root2.children << page
        page.root_parent_children.should == [root2]
      end

    end

  end
end
