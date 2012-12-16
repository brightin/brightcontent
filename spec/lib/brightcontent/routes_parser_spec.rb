require "brightcontent/routes_parser"

class Blog ; end
class Article ; end

module Brightcontent
  describe RoutesParser do
    let(:engine_resources) { %w{pages sessions admin_users} }
    let(:routes_hash) do
      [ {}, nil, {:action=>"admin"},
      {:action=>"index", :controller=>"brightcontent/blogs"},
      {:action=>"create", :controller=>"brightcontent/blogs"} ]
    end

    subject(:parser) { RoutesParser.parse(routes_hash, engine_resources) }

    it { should eq [Blog] }

    context "with extra resource" do
      before { routes_hash << {:action=>"index", :controller=>"brightcontent/articles"} }
      it { should eq [Blog, Article] }
    end

    context "with engine resources" do
      before do
        engine_resources.each do |resource_name|
          routes_hash << {:action=>"index", :controller=>"brightcontent/#{resource_name}"}
        end
      end
      it { should eq [Blog] }
    end

  end
end
