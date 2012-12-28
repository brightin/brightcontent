require 'spec_helper'

module Brightcontent
  describe Attachment do
    subject(:attachment) { Attachment.new }

    describe ".attachment_styles" do
      context "without extra options" do
        its(:attachment_styles) { should == { brightcontent: "100x100#" } }
      end
      context "with extra options" do
        let(:blog) { build_stubbed(:blog) }
        before { attachment.attachable = blog }

        its(:attachment_styles) { should == { test: "200x200", brightcontent: "100x100#" } }
      end
    end
  end
end
