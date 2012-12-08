require 'spec_helper'

module Brightcontent
  describe Page do
    it "should create a slug" do
      page = build_stubbed :page, name: "Test pagina"
      page.valid?
      page.slug.should eq "test-pagina"
    end
  end
end
