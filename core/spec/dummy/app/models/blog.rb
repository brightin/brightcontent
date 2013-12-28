class Blog < ActiveRecord::Base
  has_many :comments
  scope :featured, ->{ where(:featured => true) }
end
