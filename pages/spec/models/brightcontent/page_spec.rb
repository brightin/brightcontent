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
  end
end
