require 'spec_helper'

module Brightcontent
  describe Page do
    describe "validations" do
      it "validates persence of name" do
        build_stubbed(:page, name: nil).should_not be_valid
      end
    end

    describe "callbacks" do
      it 'expires path cache after commit' do
        expect(Pages::PathConstraint).to receive(:expire)
        create(:page)
      end
    end

    describe "#find_by_path" do
      it 'finds the page by path' do
        create(:page)
        page = create(:page, name: "About us")
        expect(Page.find_by_path('/about-us')).to eq page
      end
    end

    describe '#sanitize_path' do
      it 'removes the leading slash' do
        expect(Page.sanitize_path('/path')).to eq 'path'
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

        it "creates a slug for multiple children" do
          about_us = create(:page, name: "About us", parent: homepage)
          create(:page, name: "More", parent: about_us).slug.should eq "homepage/about-us/more"
        end

        it "persists the slug" do
          page = create(:page, name: "About us", parent: homepage).reload
          page.slug.should eq "homepage/about-us"
        end

        it "creates a path for multiple children" do
          about_us = create(:page, name: "About us", parent: homepage)
          create(:page, name: "More", parent: about_us).path.should eq "/homepage/about-us/more"
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
