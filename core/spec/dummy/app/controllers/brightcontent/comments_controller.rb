class Brightcontent::CommentsController < Brightcontent::BaseController
  def blog
    Blog.find(params[:blog_id])
  end

  def base_collection
    blog.comments
  end

  def resource_path(res = resource)
    [brightcontent, blog, res]
  end

  def resource_index_path
    [brightcontent, blog, resource_class]
  end

  def resource_edit_path(res = resource)
    [brightcontent, :edit, blog, res]
  end
end
