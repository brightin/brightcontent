class Blog < ActiveRecord::Base
  attr_accessible :body, :name, :featured
  has_many :attachments, as: :attachable, dependent: :destroy, class_name: Brightcontent::Attachment
end
