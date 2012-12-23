class AddFeaturedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :featured, :boolean
  end
end
