class AddAuthorIdToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :author
  end
end
