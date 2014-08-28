class Blog < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  scope :featured, ->{ where(:featured => true) }
end
