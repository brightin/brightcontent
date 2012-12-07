require "brightcontent/routes_parser"

class Blog ; end
class Article ; end

module Brightcontent
  describe RoutesParser do
    let(:routes_hash) do
      [ {}, nil, {:action=>"admin"},
      {:action=>"index", :controller=>"brightcontent/blogs"},
      {:action=>"create", :controller=>"brightcontent/blogs"} ]
    end

    before { Brightcontent.stub(:engine_resources).and_return(["pages", "sessions", "users"]) }

    it "extracts resource from hash" do
      RoutesParser.parse(routes_hash).should eq [Blog]
    end

    it "extracts multiple resources from hash" do
      routes_hash << {:action=>"index", :controller=>"brightcontent/articles"}
      RoutesParser.parse(routes_hash).should eq [Blog, Article]
    end

    it "ignores the pages route" do
      routes_hash << {:action=>"index", :controller=>"brightcontent/pages"}
      RoutesParser.parse(routes_hash).should eq [Blog]
    end

    it "ignores the pages route" do
      routes_hash << {:action=>"index", :controller=>"brightcontent/sessions"}
      RoutesParser.parse(routes_hash).should eq [Blog]
    end

  end
end
