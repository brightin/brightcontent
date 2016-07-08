class Brightcontent::GroupedBlogsController < Brightcontent::BaseController
  def collection
    super.group(:author_id)
  end
end
