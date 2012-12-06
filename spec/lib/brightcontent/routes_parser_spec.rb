require "brightcontent/routes_parser"

describe RoutesParser do
  let(:routes_hash) do
    [
     {},
     nil,
     {:action=>"admin"},
     {:action=>"index", :controller=>"brightcontent/blogs"},
     {:action=>"create", :controller=>"brightcontent/blogs"}
    ]
  end

  it "should extract resource from hash" do
    RoutesParser.parse(routes_hash).should eq ["Blogs"]
  end

  it "should extract multiple resources from hash" do
    routes_hash << {:action=>"index", :controller=>"brightcontent/articles"}
    RoutesParser.parse(routes_hash).should eq ["Blogs", "Articles"]
  end

end
