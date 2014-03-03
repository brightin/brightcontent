require 'spec_helper'

module Brightcontent
  describe Attachment do
    subject(:attachment) { Attachment.new(asset_content_type: 'image/jpg') }

    describe ".attachment_styles" do
      context "without extra options" do
        its(:attachment_styles) { should == { brightcontent: "100x100#", main: "200x200#" } }
      end
      context "with extra options" do
        let(:blog) { build_stubbed(:blog) }
        before { attachment.attachable = blog }

        its(:attachment_styles) { should == { test: "200x200", brightcontent: "100x100#", main: "200x200#" } }
      end
    end

    describe ".reposition!" do
      let!(:blog) { build_stubbed(:blog) }
      let!(:attachment_1) { blog.attachments.create!(:asset => Rails.root.join("public/rails.png").open) }
      let!(:attachment_2) { blog.attachments.create!(:asset => Rails.root.join("public/rails.png").open) }
      let!(:attachment_3) { blog.attachments.create!(:asset => Rails.root.join("public/rails.png").open) }

      it "reorders the attachments as specified" do
        ids = [attachment_2.id, attachment_3.id, attachment_1.id]
        Attachment.reposition! ids
        blog.attachments.pluck(:id).should == ids
      end

      it "sets unspecified attachments' positions to nil" do
        ids = [attachment_3.id, attachment_2.id]
        Attachment.reposition! ids
        attachment_1.reload.position.should be_nil
      end
    end
  end
end
