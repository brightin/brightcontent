class AddActiveToBlogs < ActiveRecord::Migration[4.2]
  def change
    add_column :blogs, :active, :boolean, default: true
  end
end
