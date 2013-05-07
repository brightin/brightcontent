require "brightcontent/routes_parser"

module Brightcontent
  describe RoutesParser do
    let(:engine_resources) { %w{sessions admin_users} }
    let(:routes_hash) do
      [ {}, nil, {:action=>"admin"},
      {:action=>"index", :controller=>"brightcontent/blogs"},
      {:action=>"create", :controller=>"brightcontent/blogs"} ]
    end

    subject(:parser) { RoutesParser.new(routes_hash, engine_resources) }

    its(:resources) { should eq [resource("blogs")] }

    context "with extra resource" do
      before { routes_hash << {:action=>"index", :controller=>"brightcontent/articles"} }
      its(:resources) { should eq [resource("blogs"), resource("articles")] }
    end

    context "with engine resources" do
      before do
        engine_resources.each do |resource_name|
          routes_hash << {:action=>"index", :controller=>"brightcontent/#{resource_name}"}
        end
      end
      its(:resources) { should eq [resource("blogs")] }
    end

    context "duplicate resources" do
      before do
        routes_hash << {action: "index", controller: "brightcontent/blogs" }
      end

      its(:resources) { should eq [resource("blogs")] }
    end

    def resource(path)
      RoutesParser::Resource.new(path)
    end

  end
end
