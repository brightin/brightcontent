require "brightcontent/routes_parser"

module Brightcontent
  describe RoutesParser do
    let(:engine_resources) { %w{sessions admin_users} }
    let(:routes_hash) do
      [ {}, nil, {:action=>"admin"},
      {:action=>"index", :controller=>"brightcontent/blogs", :path_spec => '/blogs(.:format)'},
      {:action=>"create", :controller=>"brightcontent/blogs", :path_spec => '/blogs(.:format)'},
      {:controller=>"brightcontent/comments", :action=>"show", :path_spec=>"/blogs/:blog_id/comments/:id(.:format)"}]
    end

    subject(:parser) { RoutesParser.new(routes_hash, engine_resources) }

    its(:resources) { should eq [Resource.new("blogs")] }

    context "with extra resource" do
      before { routes_hash << {:action=>"index", :controller=>"brightcontent/articles", :path_spec => '/articles' } }
      its(:resources) { should eq [Resource.new("blogs"), Resource.new("articles")] }
    end

    context "with engine resources" do
      before do
        engine_resources.each do |resource_name|
          routes_hash << {:action=>"index", :controller=>"brightcontent/#{resource_name}"}
        end
      end
      its(:resources) { should eq [Resource.new("blogs")] }
    end

    context "duplicate resources" do
      before do
        routes_hash << {action: "index", controller: "brightcontent/blogs" }
      end

      its(:resources) { should eq [Resource.new("blogs")] }
    end
  end
end
