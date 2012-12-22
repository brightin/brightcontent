class Blog < ActiveRecord::Base
  attr_accessible :body, :name
  has_many :assets, :as => :attachable, :dependent => :destroy, class_name: Brightcontent::Asset
  accepts_nested_attributes_for :assets, :allow_destroy => true
end
