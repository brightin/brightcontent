class Blog < ActiveRecord::Base
  attr_accessible :body, :name, :featured
  scope :featured, where(:featured => true)
end
