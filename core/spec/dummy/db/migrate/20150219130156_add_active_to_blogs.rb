class AddActiveToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :active, :boolean, default: true
  end
end
