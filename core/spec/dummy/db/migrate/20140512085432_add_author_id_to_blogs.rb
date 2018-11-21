class AddAuthorIdToBlogs < ActiveRecord::Migration[4.2]
  def change
    add_reference :blogs, :author
  end
end
