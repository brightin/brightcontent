class AddFeaturedToBlog < ActiveRecord::Migration[4.2]
  def change
    add_column :blogs, :featured, :boolean
  end
end
