require 'spec_helper'

module Brightcontent
  describe ModelExtensions do
    let(:columns) {  ["id", "name", "body", "created_at", "updated_at", "featured", "author_id"] }
    subject(:blog) { Blog }
    its(:brightcontent_columns) { should eq columns }

    context "with extra method" do
      before { Blog.add_brightcontent_column("test_column") }
      its(:brightcontent_columns) { should eq columns + ["test_column"] }
      its(:column_names) { should eq columns }
    end
  end
end
