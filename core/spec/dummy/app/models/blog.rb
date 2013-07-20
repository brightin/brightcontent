class Blog < ActiveRecord::Base
  scope :featured, where(:featured => true)
  has_many :comments
end
