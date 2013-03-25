class Blog < ActiveRecord::Base
  scope :featured, where(:featured => true)
end
