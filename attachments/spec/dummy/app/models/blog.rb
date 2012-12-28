class Blog < ActiveRecord::Base
  attr_accessible :body, :name, :featured
  include Brightcontent::Attachable
end
