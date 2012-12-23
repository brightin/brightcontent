class Brightcontent::BlogsController < Brightcontent::BaseController
  has_scope :featured, :type => :boolean
end
