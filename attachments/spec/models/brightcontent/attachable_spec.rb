require 'spec_helper'

module Brightcontent
  describe Attachable do
    subject { Blog }
    its(:brightcontent_columns) { should include "attachments" }

    it "should have a has_many relation to attachments" do
      Blog.reflect_on_association(:attachments).macro.should eq :has_many
    end

    it "should have .attachment method" do
      Blog.new.should respond_to :attachment
    end
  end
end
