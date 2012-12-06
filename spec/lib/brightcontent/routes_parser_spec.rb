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

  it "extracts resource from hash" do
    RoutesParser.parse(routes_hash).should eq ["blogs"]
  end

  it "extracts multiple resources from hash" do
    routes_hash << {:action=>"index", :controller=>"brightcontent/articles"}
    RoutesParser.parse(routes_hash).should eq ["blogs", "articles"]
  end

  it "ignores the pages route" do
    routes_hash << {:action=>"index", :controller=>"brightcontent/pages"}
    RoutesParser.parse(routes_hash).should eq ["blogs"]
  end

  it "ignores the pages route" do
    routes_hash << {:action=>"index", :controller=>"brightcontent/sessions"}
    RoutesParser.parse(routes_hash).should eq ["blogs"]
  end

end
