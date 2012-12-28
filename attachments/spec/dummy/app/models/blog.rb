class Blog < ActiveRecord::Base
  attr_accessible :body, :name, :featured
  include Brightcontent::Attachable

  def attachment_styles
    { test: "200x200" }
  end
end
