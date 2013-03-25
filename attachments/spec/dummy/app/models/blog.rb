class Blog < ActiveRecord::Base
  include Brightcontent::Attachable

  def attachment_styles
    { test: "200x200" }
  end
end
